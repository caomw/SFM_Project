package com.project.fpt.sfm.service;

import com.project.fpt.sfm.common.Utils;
import com.project.fpt.sfm.entities.*;
import com.project.fpt.sfm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Khắc Vỹ on 10/8/2015.
 */
@Service
@Transactional
public class AdminServiceImpl implements AdminService{
    @Autowired
    StudentService studentService;
    @Autowired
    StudentRepository studentRepository;
    @Autowired
    TermRepository termRepository;
    @Autowired
    TaskScheduler taskScheduler;
    @Autowired
    TuitionPaymentRepository tuitionPaymentRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    ManagerRepository managerRepository;

    /**
     * Create new Season
     *
     * @param season
     * @return
     */
    @Override
    //@PostConstruct
    public Term addSeason(Term season) {
        taskScheduler.schedule(new Runnable() {
            @Override
            public void run() {
                System.out.println("Run job ..............");
            }
        }, new Date(System.currentTimeMillis() + 30*1000));

        makeTuitionPlan();


        return new Term();
        //return seasonRepository.save(season);
    }

    /**
     * Get All Tuition Payment
     *
     * @return
     */
    @Override
    public List<TuitionPayment> getListTuitionPayment() {
        Sort sort = new Sort(Sort.Direction.DESC, "transferDate");
        return tuitionPaymentRepository.findAll(sort);
    }

    /**
     * Get Logged Manager
     *
     * @return
     */
    @Override
    public Manager getCurrentUser() {
        org.springframework.security.core.userdetails.User loginUser = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (loginUser != null) {
            User user = userRepository.findByUsername(loginUser.getUsername());
            Manager manager = managerRepository.findOne(user.getUserId());
            return manager;
        }
        return null;
    }

    private void makeTuitionPlan(){
        List<TuitionPlan> listTuitionPlan = new ArrayList<>();

        Student student = studentRepository.findOne(4);
        StudyLevel nextLevel = studentService.getNextStudyLevel(student);
        /**
         * Tuition fee
         */
        if(nextLevel != null){
            TuitionPlan semesterTuition = new TuitionPlan();
            semesterTuition.setTuitionName("Học phí : ");
            semesterTuition.setTuition(Utils.calculateTuition(nextLevel.getTuitionUsd(), student.getFinancialType().getFinancialRate()));
            System.out.println("Hoc phi : " + Utils.calculateTuition(nextLevel.getTuitionUsd(), student.getFinancialType().getFinancialRate()));
            semesterTuition.setStudent(student);
            semesterTuition.setIsActive(true);
            listTuitionPlan.add(semesterTuition);
        }
        /**
         * Resit course
         */
        List<Subject> listFailedSubject = studentService.getFailedSubject(student);
        if(listFailedSubject.size() > 0){
            TuitionPlan tPlan;
            for(Subject subject : listFailedSubject){
                tPlan = new TuitionPlan();
                tPlan.setTuitionName("Học Lại " + subject.getSubjectNameE());
                tPlan.setTuition(Utils.calculateResitTuition(subject.getNumOfCredit(), student.getFinancialType().getFinancialTypeName(), student.getFinancialType().getFinancialRate()));
                tPlan.setStudent(student);
                tPlan.setIsActive(true);

                System.out.println("Tien hoc lai : " + Utils.calculateResitTuition(subject.getNumOfCredit(), student.getFinancialType().getFinancialTypeName(), student.getFinancialType().getFinancialRate()));
                listTuitionPlan.add(tPlan);
            }
        }

        student.getTuitionPlans().addAll(listTuitionPlan);
        studentRepository.save(student);
    }
}
