package com.project.fpt.sfm.web.controller.student;

import com.project.fpt.sfm.entities.*;
import com.project.fpt.sfm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Khắc Vỹ on 10/5/2015.
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    StudentService studentService;

    @RequestMapping("")
    public String home(Model model) {
        model.addAttribute("sidebar", "student/student-sidebar");
        model.addAttribute("content", "student/student-home");

        /**
         * Get current user login
         */
        Student student = studentService.getCurrentStudent();
        if (student != null) {
            String financeType = student.getFinancialType().getFinancialTypeName();
            model.addAttribute("financeType", financeType);
        } else {
            model.addAttribute("error", "Something went wrong !");
        }


        return "home";
    }

    @RequestMapping("/thong-tin-ca-nhan")
    public String viewProfile(Model model) {
        model.addAttribute("sidebar", "student/student-sidebar");
        model.addAttribute("content", "student/profile");

        /**
         * Get current user login
         */
        Student student = studentService.getCurrentStudent();
        model.addAttribute("student", student);

        return "home";
    }

    @RequestMapping(value = "/cac-ky-da-hoc")
    public String studyHistory(Model model, @RequestParam(value = "maso", defaultValue = "-1", required = false) int semesterId) {
        model.addAttribute("sidebar", "student/student-sidebar");
        model.addAttribute("content", "student/study-history");

        /**
         * Get current user login
         */
        Student student = studentService.getCurrentStudent();
        List<Semester> listSemester = studentService.getListSemester(student);
        if (listSemester.size() > 0) {
            Semester currentSemester;
            if (semesterId < 0) {
                currentSemester = listSemester.remove(0);
            } else {
                currentSemester = studentService.findSemesterById(semesterId);
                if(currentSemester != null){
                    listSemester.remove(currentSemester);
                }else{
                    currentSemester = listSemester.remove(0);
                }
            }
            model.addAttribute("currentSemester", currentSemester);
            /**
             * Get List Course
             */
            List<StudentCourse> listStudyCourse = studentService.getListCourseInSemester(student, currentSemester);
            model.addAttribute("listCourse", listStudyCourse);
        }
        model.addAttribute("listStudentSemester", listSemester);

        return "home";
    }

    @RequestMapping(value = "/hoc-phi-cac-ky")
    public String sessionFinanceStatus(Model model) {
        model.addAttribute("sidebar", "student/student-sidebar");
        model.addAttribute("content", "student/tuition-history");
        /**
         * Get current user login
         */
        Student student = studentService.getCurrentStudent();
        List<TuitionPayment> listPayment = studentService.getListTuitionPayment(student);
        model.addAttribute("listPayment", listPayment);

        return "home";
    }

    @RequestMapping(value = "/danh-sach-dong-tien-hoc-lai")
    public String resitCourseFinancialStatus(Model model) {
        model.addAttribute("sidebar", "student/student-sidebar");
        model.addAttribute("content", "student/resit-course-financial-history");
        /**
         * Get current user login
         */
        Student student = studentService.getCurrentStudent();
        List<RetakeCoursePayment> listResitCourse = studentService.getListResitCoursePayment(student);
        model.addAttribute("listResitCourse", listResitCourse);

        return "home";
    }

    @RequestMapping(value = "/hoc-phi-du-kien")
    public String tuitionOverview(Model model) {
        model.addAttribute("sidebar", "student/student-sidebar");
        model.addAttribute("content", "student/tuition-overview");
        /**
         * Get current user login
         */
        Student student = studentService.getCurrentStudent();
        model.addAttribute("student", student);
        List<Tuition> listTuition = studentService.getListTuition();
        model.addAttribute("listTuition", listTuition);
        int rate = studentService.getFinancialRateOfStudent(student);
        float factor = 0;
        if(rate < 100){
            factor = (float)rate/100;
        }
        model.addAttribute("rate", rate);
        model.addAttribute("factor", factor);

        return "home";
    }

    @RequestMapping(value = "/ajax/hoc-phi-du-kien")
    @ResponseBody
    public List<Tuition> tuitionOverviewAjax(Model model) {
      //  model.addAttribute("sidebar", "student/student-sidebar");
       // model.addAttribute("content", "student/tuition-overview");
        /**
         * Get current user login
         */
        Student student = studentService.getCurrentStudent();
       // model.addAttribute("student", student);
        List<Tuition> listTuition = studentService.getListTuition();
       /* model.addAttribute("listTuition", listTuition);
        int rate = studentService.getFinancialRateOfStudent(student);
        float factor = 0;
        if(rate < 100){
            factor = (float)rate/100;
        }
        model.addAttribute("rate", rate);
        model.addAttribute("factor", factor);*/

        return listTuition;
    }

    @RequestMapping(value = "/cac-mon-no")
    public String resitCourseHistory(Model model) {
        model.addAttribute("sidebar", "student/student-sidebar");
        model.addAttribute("content", "student/resit-course-history");
        /**
         * Get current user login
         */
        Student student = studentService.getCurrentStudent();
        List<StudentCourse> listResitCourse = studentService.getListResitCourse(student);
        model.addAttribute("listResitCourse", listResitCourse);

        return "home";
    }

    @RequestMapping(value = "/last")
    public String studentTest(Model model) {
        /**
         * Get current user login
         */
        Student student = studentService.getCurrentStudent();
        //studentService.getNextStudyLevel(student);
        List<Subject> list = studentService.getFailedSubject(student);
        if(list.size() > 0){
            for(Subject s : list){
                System.out.println("Course : " + s.getSubjectNameE());
            }
        }

        return "home";
    }
}
