package com.project.fpt.sfm.web.controller.student;

import com.project.fpt.sfm.service.StudentService;
import com.project.fpt.sfm.web.controller.AbstractController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Khoa on 10/9/2015.
 */
@RequestMapping("/student")
public abstract class AbstractStudentController extends AbstractController {

    @Autowired
    StudentService studentService;

    public void initSidebar(Model model) {
        model.addAttribute("sidebar", "student/student-sidebar");
    }
}
