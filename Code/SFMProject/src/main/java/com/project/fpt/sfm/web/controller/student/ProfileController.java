package com.project.fpt.sfm.web.controller.student;

import com.project.fpt.sfm.entities.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Khoa on 10/9/2015.
 */
@Controller
public class ProfileController extends AbstractStudentController {

    @RequestMapping("/thong-tin-ca-nhan")
    public String index(Model model) {
        initSidebar(model);
        Student student = studentService.getCurrentStudent();
        model.addAttribute("student", student);

        model.addAttribute("content", "student/profile/index");
        return "home";
    }

    @RequestMapping("/profile/update")
    public String saveProfile(Student student) {
        student.setStudentId(studentService.getCurrentStudent().getStudentId());
        studentService.saveStudent(student);
        return "redirect:/student/thong-tin-ca-nhan";
    }
}
