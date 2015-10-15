package com.project.fpt.sfm.web.controller.student;

import com.project.fpt.sfm.entities.Course;
import com.project.fpt.sfm.entities.Semester;
import com.project.fpt.sfm.entities.Student;
import com.project.fpt.sfm.service.StudentService;
import com.project.fpt.sfm.service.TrungStudentService;
import com.project.fpt.sfm.service.TuitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by TrungHD on 15/10/2015.
 */
@Controller
@RequestMapping("/sinh-vien")
public class StudentController {

    @Autowired
    TrungStudentService trungStudentService;
    @Autowired
    TuitionService tuitionService;

    @RequestMapping("")
    public String home(Model model) {
        model.addAttribute("sidebar", "student/student-sidebar");
        model.addAttribute("content", "student/student-home");

        /**
         * Get current user login
         */
//        Student student = studentService.getCurrentStudent();
//        if (student != null) {
//            String financeType = student.getFinancialType().getFinancialTypeName();
//            model.addAttribute("financeType", financeType);
//        } else {
//            model.addAttribute("error", "Something went wrong !");
//        }


        return "home";
    }
    @RequestMapping("/thong-tin-ca-nhan")
    public String viewProfile(Model model){
        model.addAttribute("sidebar", "student/student-sidebar");
        model.addAttribute("content", "student/profile");

        /**
         * Get current user login
         */
        Student student = trungStudentService.viewProfile();
        model.addAttribute("student", student);

        return "home";
    }

    @RequestMapping(value = "/cac-ky-da-hoc")
    public String studyHistory(Model model, @RequestParam(value = "maso", defaultValue = "-1", required = false) int semesterId){
        model.addAttribute("sidebar", "student/student-sidebar");
        model.addAttribute("content", "student/study-history");

        Student student = trungStudentService.viewProfile();
        List<Semester> listSemester = trungStudentService.getListSemester(student);

        if (listSemester.size() > 0) {
            Semester currentSemester;
            if (semesterId < 0) {
                currentSemester = listSemester.remove(0);
            } else {
                currentSemester = trungStudentService.findSemesterById(semesterId);
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
            List<Course> listStudyCourse = trungStudentService.getListCourse(student,currentSemester);
            model.addAttribute("listCourse", listStudyCourse);
        }
        model.addAttribute("listStudentSemester", listSemester);

        return "home";
    }
    @RequestMapping(value = "/hoc-phi-du-kien")
    public String tuitionOverview(Model model) {
        model.addAttribute("sidebar", "student/student-sidebar");
        model.addAttribute("content", "student/tuition-overview");
        /**
         * Get current user login
         */
       Student student = trungStudentService.viewProfile();
        List<Semester> semesters = tuitionService.getTuitionOfSemester(student.getMajor());
        model.addAttribute("semesters",semesters);
        model.addAttribute("student",student);
        return "home";
    }
}
