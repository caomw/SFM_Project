package com.project.fpt.sfm.service;

import com.project.fpt.sfm.common.Constant;
import com.project.fpt.sfm.common.DateTimeUtils;
import com.project.fpt.sfm.common.Utils;
import com.project.fpt.sfm.entities.*;
import com.project.fpt.sfm.processexcel.development.model.TuitionPaymentModel;
import com.project.fpt.sfm.processexcel.model.TuitionPaymentTemplate;
import com.project.fpt.sfm.repository.*;
import com.sun.org.apache.xml.internal.security.c14n.helper.C14nHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Khắc Vỹ on 10/14/2015.
 */
@Service
public class TuitionServiceImpl implements TuitionService {
    @Autowired
    CourseService courseService;
    @Autowired
    StudentRepo studentRepo;
    @Autowired
    StudyStageRepo studyStageRepo;
    @Autowired
    TermRepo termRepo;
    @Autowired
    SemesterRepo semesterRepo;
    @Autowired
    SubtractTuitionRepo subtractTuitionRepo;
    @Autowired
    TuitionPaymentRepo tuitionPaymentRepo;
    @Autowired
    CourseRepo courseRepo;
    @Autowired
    ClassRepo classRepo;

    @Override
    public boolean saveTuitionPayment(TuitionPaymentModel model) {
        TuitionPayment tPayment = new TuitionPayment();

        int totalTuition;
        int paidTuition;
        int subtractLaptop = 0;
        int subtractMath = 0;
        int subtractOther = 0;

        /**
         * Total
         */
        try {
            Double ttTuition = Double.parseDouble(model.getMucHocPhi());
            totalTuition = ttTuition.intValue();
        } catch (Exception e) {
            totalTuition = 0;
        }

        /**
         * Paid
         */
        try {
            Double pTuition = Double.parseDouble(model.getSoTienSvChuyenKhoan());
            paidTuition = pTuition.intValue();
        } catch (Exception e) {
            paidTuition = 0;
        }

        /**
         * Laptop
         */
        try {
            Double subLaptop = Double.parseDouble(model.getLaptop());
            subtractLaptop = subLaptop.intValue();
        } catch (Exception e) {
            subtractLaptop = 0;
        }

        /**
         * Math
         */
        try {
            Double subMath = Double.parseDouble(model.getOnToan());
            subtractMath = subMath.intValue();
        } catch (Exception e) {
            subtractMath = 0;
        }

        /**
         * Other
         */
        try {
            Double subOther = Double.parseDouble(model.getKhac());
            subtractOther = subOther.intValue();
        } catch (Exception e) {
            subtractOther = 0;
        }

        tPayment.setTotalTuition(totalTuition);
        tPayment.setPaidTuition(paidTuition);

        System.out.println(Constant.ANSI_RED + "Student : " + model.getTenSinhVien());
        System.out.println(Constant.ANSI_RED + "Total : " + totalTuition);
        System.out.println(Constant.ANSI_RED + "Paid : " + paidTuition);
        System.out.println(Constant.ANSI_RED + "Laptop : " + subtractLaptop);
        System.out.println(Constant.ANSI_RED + "OnToan : " + subtractMath);
        System.out.println(Constant.ANSI_RED + "Othe : " + subtractOther);

        tPayment.setBank(model.getNganHang());
        if (model.getNgayChuyenKhoan() != null) {
            Date transferDate = DateTimeUtils.parseDate(model.getNgayChuyenKhoan(), "dd/MM/yyyy");
            tPayment.setTransferDate(transferDate);
        }
        /**
         * Student
         */
        Student student = studentRepo.findByStudentCode(model.getMssv());
        tPayment.setStudent(student);
        /**
         * Study Stage - content
         */

        StudyStage studyStage = studyStageRepo.findByStageCode(model.getNoiDungNopTien());
        Term curTerm = termRepo.findByIsCurrent(true);
        System.out.println(model.getTenSinhVien());
        System.out.println(curTerm.getTermName());
        System.out.println(model.getNoiDungNopTien());
        System.out.println(studyStage.getStageCode());
        Semester semester = semesterRepo.findByTermAndMajorAndStudyStage(curTerm, student.getMajor(), studyStage);

        tPayment.setSemester(semester);

        //  int totalTuition = semester.getStageTuitionUsd() * Constant.MONEY_CHECK;
        int totalSubTuition = 0;
        /**
         * Subtract tuition
         */

        FinancialType fType = student.getFinancialType();

        if (subtractLaptop > 0) {
            SubtractTuition subTuition = new SubtractTuition();
            subTuition.setSubtractTuitionName("LAPTOP");
            subTuition.setSubtractTuition(subtractLaptop);
            totalSubTuition += subtractLaptop;

            subtractTuitionRepo.save(subTuition);
            tPayment.setSubtractTuition(subTuition);
        }
        if (subtractMath > 0) {
            SubtractTuition subTuition = new SubtractTuition();
            subTuition.setSubtractTuitionName("ÔN TOÁN");
            subTuition.setSubtractTuition(subtractMath);
            totalSubTuition += subtractMath;

            subtractTuitionRepo.save(subTuition);
            tPayment.setSubtractTuition(subTuition);
        }
        if (subtractOther > 0) {
            SubtractTuition subTuition = new SubtractTuition();
            subTuition.setSubtractTuitionName("KHÁC");
            subTuition.setSubtractTuition(subtractOther);
            totalSubTuition += subtractOther;

            subtractTuitionRepo.save(subTuition);
            tPayment.setSubtractTuition(subTuition);
        }

        SubtractTuition subTuition = null;
        if (fType.getFinancialTypeName().equals(Constant.FINANCE_TYPE_SCHOLARSHIP)) {
             subTuition = new SubtractTuition();
            subTuition.setSubtractTuitionName("HOC BONG " + fType.getFinancialRate() + " %");
            float factor = (float) fType.getFinancialRate() / 100;
            int sTuition = (int) (totalTuition * factor);
            subTuition.setSubtractTuition(sTuition);
            totalSubTuition += sTuition;
        } else if (fType.getFinancialTypeName().equals(Constant.FINANCE_TYPE_LOANS_CREDIT)) {
              subTuition = new SubtractTuition();
            subTuition.setSubtractTuitionName("TIN DUNG " + fType.getFinancialRate() + " %");
            float factor = (float) fType.getFinancialRate() / 100;
            int sTuition = (int) (totalTuition * factor);
            subTuition.setSubtractTuition(sTuition);
            totalSubTuition += sTuition;
        } else if (fType.getFinancialTypeName().equals(Constant.FINANCE_TYPE_INVESTING)) {
             subTuition = new SubtractTuition();
            subTuition.setSubtractTuitionName("CUNG BAN DAU TU " + fType.getFinancialRate() + " %");
            float factor = (float) fType.getFinancialRate() / 100;
            int sTuition = (int) (totalTuition * factor);
            subTuition.setSubtractTuition(sTuition);
            totalSubTuition += sTuition;
        }
        if(subTuition != null){
            subtractTuitionRepo.save(subTuition);
            tPayment.setSubtractTuition(subTuition);
        }

        int realTotalTuition = totalTuition - totalSubTuition;
        tPayment.setTotalTuition(totalTuition);
        if (realTotalTuition - paidTuition <= Constant.MONEY_RANGE) {
            tPayment.setStatus(true);
            /**
             * Enable Student course
             */
            if (!model.getLop().equals(Constant.DEFAULT_STRING_VALUE)) {
                Clazz clazz = classRepo.findByClassName(model.getLop());
                courseService.addCourseForStudent(student, clazz);
            }

        } else {
            tPayment.setStatus(false);
        }

/*
        if (subTuition != null) {
            System.out.println("Subtract : " + subTuition);

            subtractTuitionRepo.save(subTuition);
            tPayment.setSubtractTuition(subTuition);
        }*/

        System.out.println("Payment : " + tPayment);

        //return true;
        return tuitionPaymentRepo.save(tPayment) != null;

    }

    @Override
    public List<Semester> getTuitionOfSemester(Major major) {
        Term term = termRepo.findByIsCurrent(true);
        return semesterRepo.findByMajorAndTerm(major, term);
    }

}
