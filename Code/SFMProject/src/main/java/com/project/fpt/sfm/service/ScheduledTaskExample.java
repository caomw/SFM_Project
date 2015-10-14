package com.project.fpt.sfm.service;

import com.project.fpt.sfm.entities.*;
import com.project.fpt.sfm.repository.SemesterRepo;
import com.project.fpt.sfm.repository.StudentRepo;
import com.project.fpt.sfm.repository.StudyStageRepo;
import com.project.fpt.sfm.repository.TermRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/**
 * Created by Khắc Vỹ on 10/14/2015.
 */
@Service
public class ScheduledTaskExample {
    @Autowired
    StudentRepo studentRepo;
    @Autowired
    TermRepo termRepo;
    @Autowired
    StudyStageRepo studyStageRepo;
    @Autowired
    SemesterRepo semesterRepo;


    private final ScheduledExecutorService scheduler = Executors
            .newScheduledThreadPool(1);

    public void startScheduleTask() {
        /**
         * not using the taskHandle returned here, but it can be used to cancel
         * the task, or check if it's done (for recurring tasks, that's not
         * going to be very useful)
         */
        final ScheduledFuture<?> taskHandle = scheduler.scheduleAtFixedRate(
                new Runnable() {
                    public void run() {
                        try {
                            getDataFromDatabase();
                        }catch(Exception ex) {
                            ex.printStackTrace(); //or loggger would be better
                        }
                    }
                }, 0, 15, TimeUnit.MINUTES);

    }

    /**
     * Make Tuition Plan For Current Student
     */
    private void getDataFromDatabase() {
        /**
         * Get all Student is studying
         */
        List<Student> listStudent = studentRepo.findByIsActive(true);


    }

    public void makeTuitionPlanForStudent(Student student){
        Term curTerm = termRepo.findByIsCurrent(true);
        String curStudyStage = student.getCurrentStudyStage();
        StudyStage studyStage = studyStageRepo.findByStageCode(curStudyStage);
       // Semester semester = semesterRepo.findByTermAndMajorAndStudyStage()
    }

    public void shutdowh() {
        System.out.println("shutdown...");
        if(scheduler != null) {
            scheduler.shutdown();
        }
    }

   /* public static void main(String[] args) {
        final ScheduledTaskExample ste = new ScheduledTaskExample();
        Runtime.getRuntime().addShutdownHook(new Thread() {
            public void run() {
                ste.shutdowh();
            }
        });
        ste.startScheduleTask();

    }*/
}
