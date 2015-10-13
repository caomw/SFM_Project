package com.project.fpt.sfm.web.controller.staff;

import com.project.fpt.sfm.common.Constant;
import com.project.fpt.sfm.common.DateTimeUtils;
import com.project.fpt.sfm.entities.Term;
import com.project.fpt.sfm.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by Khắc Vỹ on 10/10/2015.
 */
@Controller
@RequestMapping("/nhan-vien/dao-tao")
public class RegistrarStaffController {
    @Autowired
    StaffService staffService;

    @RequestMapping("/nhap-hoc-ky")
    public String addTermPage(Model model){
        model.addAttribute("content", "staff/registrar-add-term");
        model.addAttribute("sidebar", "staff/staff-sidebar");

        Term term = staffService.getCurrentTerm();
        if(term != null){
            String termName = term.getTermName();
            Calendar cal = Calendar.getInstance();
            cal.setTime(term.getStartDate());
            int year = cal.get(Calendar.YEAR);
            Date startDate = null;
            Date endDate = null;
            String nextTermName = "";
            if(termName.toUpperCase().contains(Constant.TERM_FALL)){
                nextTermName = Constant.TERM_SPRING + " " + (year + 1);
                cal.set(year + 1, Constant.TERM_SPING_START_MONTH - 1, Constant.TERM_SPING_START_DATE);
                startDate = cal.getTime();
                cal.set(year + 1, Constant.TERM_SPING_END_MONTH - 1, Constant.TERM_SPING_END_DATE);
                endDate = cal.getTime();
            }else if(termName.toUpperCase().contains(Constant.TERM_SPRING)){
                nextTermName = Constant.TERM_SUMMER + " " + year;
                cal.set(year, Constant.TERM_SUMMER_START_MONTH - 1, Constant.TERM_SUMMER_START_DATE);
                startDate = cal.getTime();
                cal.set(year, Constant.TERM_SUMMER_END_MONTH - 1, Constant.TERM_SUMMER_END_DATE);
                endDate = cal.getTime();
            }else if(termName.toUpperCase().contains(Constant.TERM_SUMMER)){
                nextTermName = Constant.TERM_FALL + " " + year;
                cal.set(year, Constant.TERM_FALL_START_MONTH - 1, Constant.TERM_FALL_START_DATE);
                startDate = cal.getTime();
                cal.set(year, Constant.TERM_FALL_END_MONTH - 1, Constant.TERM_FALL_END_DATE);
                endDate = cal.getTime();
            }
            model.addAttribute("termName", nextTermName);
            model.addAttribute("startDate", startDate);
            model.addAttribute("endDate", endDate);
        }

        return "home";
    }

    @RequestMapping(value = "/nhap-hoc-ky", method = RequestMethod.POST)
    public String addTerm(Model model,
                          @RequestParam("termName") String termName,
                          @RequestParam("startDate") String startDateValue,
                          @RequestParam("endDate") String endDateValue,
                          @RequestParam("note") String note){
        model.addAttribute("content", "staff/registrar-add-term");
        model.addAttribute("sidebar", "staff/staff-sidebar");


        System.out.println("StartDate : " + startDateValue);

        Term currentTerm = staffService.getCurrentTerm();
        currentTerm.setIsActive(false);
        staffService.addTerm(currentTerm);

        Date startDate = DateTimeUtils.parseDate(startDateValue);
        Date endDate = DateTimeUtils.parseDate(endDateValue);

        Term newTerm = new Term();
        newTerm.setTermName(termName);
        newTerm.setStartDate(startDate);
        newTerm.setEndDate(endDate);
        newTerm.setNote(note);
        newTerm.setIsActive(true);

        staffService.addTerm(newTerm);

        return "redirect:/nhan-vien/dao-tao/nhap-hoc-ky";
    }
}
