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

    @Override
    public boolean saveTuitionPayment(TuitionPaymentModel model) {
        TuitionPayment tPayment = new TuitionPayment();

        int totalTuition;
        int paidTuition;
        int subtractLaptop = 0;
        int subtractMath = 0;
        int subtractOther = 0;
        try {
            Double ttTuition = Double.parseDouble(model.getMucHocPhi());
            totalTuition = ttTuition.intValue();
            Double pTuition = Double.parseDouble(model.getSoTienSvChuyenKhoan());
            paidTuition = pTuition.intValue();
            Double subLaptop = Double.parseDouble(model.getLaptop());
            subtractLaptop = subLaptop.intValue();
            Double subMath = Double.parseDouble(model.getOnToan());
            subtractLaptop = subMath.intValue();
            Double subOther = Double.parseDouble(model.getKhac());
            subtractLaptop = subOther.intValue();
        } catch (Exception e) {
            totalTuition = 0;
            paidTuition = 0;
            subtractLaptop = 0;
            subtractMath = 0;
            subtractOther = 0;
        }

        tPayment.setTotalTuition(totalTuition);
        tPayment.setPaidTuition(paidTuition);
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
        Semester semester = semesterRepo.findByTermAndMajorAndStudyStage(curTerm, student.getMajor(), studyStage);
        tPayment.setSemester(semester);

        //  int totalTuition = semester.getStageTuitionUsd() * Constant.MONEY_CHECK;
        int totalSubTuition = 0;
        /**
         * Subtract tuition
         */

        SubtractTuition subTuition = null;
        FinancialType fType = student.getFinancialType();

        if (subtractLaptop > 0) {
            subTuition = new SubtractTuition();
            subTuition.setSubtractTuitionName("LAPTOP");
            subTuition.setSubtractTuition(subtractLaptop);
            totalSubTuition += subtractLaptop;
        }
        if (subtractMath > 0) {
            subTuition = new SubtractTuition();
            subTuition.setSubtractTuitionName("ÔN TOÁN");
            subTuition.setSubtractTuition(subtractMath);
            totalSubTuition += subtractMath;
        }
        if (subtractOther > 0) {
            subTuition = new SubtractTuition();
            subTuition.setSubtractTuitionName("KHÁC");
            subTuition.setSubtractTuition(subtractOther);
            totalSubTuition += subtractOther;
        }

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

        int realTotalTuition = totalTuition - totalSubTuition;
        tPayment.setTotalTuition(totalTuition);
        if (realTotalTuition - paidTuition <= Constant.MONEY_RANGE) {
            tPayment.setStatus(true);
            /**
             * Enable Student course
             */

        } else {
            tPayment.setStatus(false);
        }


        if (subTuition != null) {
            System.out.println("Subtract : " + subTuition);

           // subtractTuitionRepo.save(subTuition);
            tPayment.setSubtractTuition(subTuition);
        }

        System.out.println("Payment : " + tPayment);

        return true;
        //return tuitionPaymentRepo.save(tPayment) != null;

    }

}
