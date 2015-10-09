package com.project.fpt.sfm.web.controller.manager;

import com.project.fpt.sfm.entities.Manager;
import com.project.fpt.sfm.entities.Student;
import com.project.fpt.sfm.entities.TuitionPayment;
import com.project.fpt.sfm.repository.StudentRepository;
import com.project.fpt.sfm.service.AdminService;
import com.project.fpt.sfm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Khắc Vỹ on 10/9/2015.
 */
@Controller
@RequestMapping("/manager")
public class ManagerController {
    @Autowired
    StudentService studentService;
    @Autowired
    AdminService adminService;
    @Autowired
    StudentRepository studentRepository;

    @RequestMapping("")
    public String home(Model model) {
        model.addAttribute("sidebar", "manager/manager-sidebar");
        model.addAttribute("content", "manager/manager-home");

        /**
         * Get current user login
         */

        return "home";
    }

    @RequestMapping("/thong-tin-ca-nhan")
    public String profile(Model model) {
        model.addAttribute("sidebar", "manager/manager-sidebar");
        model.addAttribute("content", "manager/profile");
        /**
         * Get current user login
         */
        Manager manager = adminService.getCurrentUser();
        model.addAttribute("manager", manager);

        return "home";
    }

    @RequestMapping("/danh-sach-thu-hoc-phi")
    public String listTuition(Model model) {
        model.addAttribute("sidebar", "manager/manager-sidebar");
        model.addAttribute("content", "manager/list-tuition-payment");
        /**
         * Get current user login
         */
        List<TuitionPayment> listTuitionPayment = adminService.getListTuitionPayment();
        model.addAttribute("listTuitionPayment", listTuitionPayment);

        return "home";
    }

    @RequestMapping("/lich-su-dong-hoc-phi/{studentId}")
    public String listTuition(Model model, @PathVariable("studentId") int studentId) {
        model.addAttribute("sidebar", "manager/manager-sidebar");
        model.addAttribute("content", "manager/student-financial-detail");
        /**
         * Get current user login
         */
        Student student = studentRepository.getOne(studentId);
        if(student != null){
            List<TuitionPayment> listPayment = studentService.getListTuitionPayment(student);
            model.addAttribute("listPayment", listPayment);
            model.addAttribute("student", student);
        }else{

        }

        return "home";
    }
}
