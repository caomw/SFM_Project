package com.project.fpt.sfm.service;

import com.project.fpt.sfm.entities.*;
import com.project.fpt.sfm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

/**
 * Created by Khắc Vỹ on 10/12/2015.
 */
@Service
public class SemesterServiceImpl implements SemesterService {
    @Autowired
    TermRepo termRepo;
    @Autowired
    SemesterRepo semesterRepo;
    @Autowired
    SubInSemesterRepo subInSemesterRepo;
    @Autowired
    CourseRepo courseRepo;
    @Autowired
    StudentRepo studentRepo;
    @Autowired
    StudyStageRepo studyStageRepo;

    @Autowired
    TaskScheduler taskScheduler;

    /**
     * Get Current Term
     *
     * @return
     */
    @Override
    public Term getCurrentTerm() {
        return termRepo.findByIsCurrent(true);
    }

    /**
     * Get All Semester
     *
     * @return
     */
    @Override
    public List<Semester> getListSemesterGroupByMajor(Term term) {
        return semesterRepo.findByTermGroupByMajor(term);
    }

    /**
     * Create New Term
     *
     * @param newTerm
     * @return
     */
    @Override
    public boolean createNewTerm(Term newTerm) {
        Term curTerm = getCurrentTerm();
        curTerm.setIsCurrent(false);
        curTerm.setDateUpdated(new Date());
        /**
         * Update current Term
         */
        final Term svCurTerm = termRepo.save(curTerm);
        /**
         * Save new term
         */
        Term svTerm = termRepo.save(newTerm);
        planForTerm(svCurTerm, svTerm);
        System.out.println("Insert ok");
        return svTerm != null;
    }

    /**
     * Make plan for current Term
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void planForTerm(Term oldTerm, Term newTerm) {
        System.out.println("Async Method");
        List<Semester> listOldSem = semesterRepo.findByTerm(oldTerm);
        List<SubjectInSemester> listSubInSem = subInSemesterRepo.findBySemesterTerm(oldTerm);
        /**
         * Iterator passing list semester
         */
        List<Semester> listNewSem = new ArrayList<>();
        Semester newSem;
        for (Semester sem : listOldSem) {
            newSem = new Semester();
            newSem.setTerm(newTerm);
            newSem.setMajor(sem.getMajor());
            newSem.setStudyStage(sem.getStudyStage());
            newSem.setStageTuitionUsd(sem.getStageTuitionUsd());
            //  newSem.setSubjectInSemesters(new HashSet<>(listSubInSem));
            semesterRepo.save(newSem);
            listNewSem.add(newSem);
        }
        /**
         * Loop passing List SubInSem
         */
        List<SubjectInSemester> listNewSubInSem = new ArrayList<>();
        SubjectInSemester newSubInSem;
        for (SubjectInSemester item : listSubInSem) {
            newSubInSem = new SubjectInSemester();
            newSubInSem.setSubject(item.getSubject());
            newSubInSem.setNumberOfCredit(item.getNumberOfCredit());
            newSubInSem.setHalf(item.getHalf());
            newSubInSem.setNote(item.getNote());

            for (Semester semItem : listNewSem) {
                if (semItem.getStudyStage().getStageCode().equals(item.getSemester().getStudyStage().getStageCode())) {
                    newSubInSem.setSemester(semItem);
                }
            }
            subInSemesterRepo.save(newSubInSem);
        }

        System.out.println("End sync");

        taskScheduler.schedule(new Runnable() {
            @Override
            public void run() {
                System.out.println("Scheduler");


            }
        }, new Date());
    }

    /**
     * Find next Study stage for student when create new Term
     *
     * @param term
     * @return
     */
    @Override
    public StudyStage findNextSemesterOfStudent(Student student, Term term) {
        List<Course> listCourse = courseRepo.findStudentCourseGroupByStudyStage(student);
        StudyStage curStudyStage = listCourse.get(0).getSubjectInSemester().getSemester().getStudyStage();
        int order = curStudyStage.getOrder();
        StudyStage nextStudyStage = studyStageRepo.findByOrder(order + 1);
        return nextStudyStage;
    }
}
