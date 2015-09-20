package com.project.fpt.sfm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Khắc Vỹ on 9/16/2015.
 */
@Controller
public class HomeController {

    @RequestMapping("/home")
    public String homePage(Model model){
        model.addAttribute("sidebar", "student/student-sidebar");


        return "home";
    }

    @RequestMapping("/student")
    public String studenPage(Model model){
        model.addAttribute("sidebar", "student/student-sidebar");

        return "home";
    }

    @RequestMapping("/student/hocphidukien")
    public String studentHocPhiDuKien(Model model){
        model.addAttribute("content", "student/hocphidukien");
        model.addAttribute("sidebar", "student/student-sidebar");

        return "home";
    }

    @RequestMapping("/student/cackydahoc")
    public String studentCackydahoc(Model model){
        model.addAttribute("content", "student/cackydahoc");
        model.addAttribute("sidebar", "student/student-sidebar");

        return "home";
    }

    @RequestMapping("/student/cacmonchuahoanthanh")
    public String studentCacMonChuaHoanThanh(Model model){
        model.addAttribute("content", "student/cacmonchuahoanthanh");
        model.addAttribute("sidebar", "student/student-sidebar");

        return "home";
    }
}
