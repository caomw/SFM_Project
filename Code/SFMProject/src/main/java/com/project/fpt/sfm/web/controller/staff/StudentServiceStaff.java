package com.project.fpt.sfm.web.controller.staff;

import com.project.fpt.sfm.entities.Subject;
import com.project.fpt.sfm.processexcel.model.StudentDto;
import com.project.fpt.sfm.processexcel.model.SubjectDto;
import com.project.fpt.sfm.processexcel.utils.AnnotatedExcelReport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.util.List;

/**
 * Created by Khắc Vỹ on 10/10/2015.
 */
@Controller
@RequestMapping("/nhan-vien/cong-tac-sinh-vien")
public class StudentServiceStaff {

    @RequestMapping("/nhap-thong-tin-sinh-vien")
    public String addStudentInformationPage(Model model){
        model.addAttribute("content", "staff/add-student-information");
        model.addAttribute("sidebar", "staff/staff-sidebar");


        return "home";
    }

    @RequestMapping(value = "/nhap-thong-tin-sinh-vien",method = RequestMethod.POST)
    public String addStudentInformation(@RequestParam("file") MultipartFile file, Model model){
        model.addAttribute("content", "staff/add-student-information");
        model.addAttribute("sidebar", "staff/staff-sidebar");


        if (!file.isEmpty()) {
            ByteArrayInputStream is = null;
            try {
                is = new ByteArrayInputStream(file.getBytes());
                AnnotatedExcelReport report = new AnnotatedExcelReport(is);
                List<StudentDto> listStudent = report.readData("com.project.fpt.sfm.processexcel.model.StudentDto");

                for(StudentDto studentDto : listStudent){
                    System.out.println(studentDto);
                    System.out.println();
                }


                model.addAttribute("error", "OK");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            model.addAttribute("error", "File not found !!!");
        }






        return "home";
    }
}
