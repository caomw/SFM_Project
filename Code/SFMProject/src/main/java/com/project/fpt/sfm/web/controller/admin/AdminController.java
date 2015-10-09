package com.project.fpt.sfm.web.controller.admin;

import com.project.fpt.sfm.common.Utils;
import com.project.fpt.sfm.entities.Season;
import com.project.fpt.sfm.entities.Student;
import com.project.fpt.sfm.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by Khắc Vỹ on 10/8/2015.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @RequestMapping("")
    public String home(Model model) {
        model.addAttribute("sidebar", "admin/admin-sidebar");
        model.addAttribute("content", "admin/admin-home");

        return "home";
    }

    @RequestMapping(value = "/nhap-hoc-ky", method = RequestMethod.GET)
    public String addSeasonPage(Model model) {
        model.addAttribute("sidebar", "admin/admin-sidebar");
        model.addAttribute("content", "admin/add-season");

        return "home";
    }

    @RequestMapping(value = "/nhap-hoc-ky", method = RequestMethod.POST)
    public String addSeason(Model model, HttpServletRequest request) {
        model.addAttribute("sidebar", "admin/admin-sidebar");
        model.addAttribute("content", "admin/add-season");

        String seasonName = request.getParameter("seasonName");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("startDate");
        String note = request.getParameter("note");

        Season season = new Season();
        season.setSeasonName(seasonName);
        season.setStartDate(Utils.getDate(startDate));
        season.setEndDate(Utils.getDate(endDate));
        season.setNote(note);
        season.setIsActive(true);

        Season savedSeason = adminService.addSeason(season);
        System.out.println("Saved!!!!");
        return "home";
    }

    @RequestMapping("/nhap-hoc-sinh")
    public String addStudent(Model model){
        model.addAttribute("sidebar", "admin/admin-sidebar");
        model.addAttribute("content", "admin/add-student");

        return "home";
    }
}
