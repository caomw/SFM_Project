package com.project.fpt.sfm.web.controller.staff;

import com.project.fpt.sfm.entities.Student;
import com.project.fpt.sfm.entities.Subject;
import com.project.fpt.sfm.processexcel.development.model.StudentModel;
import com.project.fpt.sfm.processexcel.model.StudentDto;
import com.project.fpt.sfm.processexcel.model.SubjectDto;
import com.project.fpt.sfm.processexcel.utils.AnnotatedExcelReport;
import com.project.fpt.sfm.web.response.UploadResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.util.List;

/**
 * Created by Khắc Vỹ on 10/12/2015.
 */
@Controller
@RequestMapping("/nhan-vien/cong-tac-sinh-vien")
public class StudentServiceStaff {

    @RequestMapping("")
    public String home(Model model) {
        model.addAttribute("content", "staff/staff-home");
        model.addAttribute("sidebar", "staff/staff-sidebar");

        return "home";
    }

    @RequestMapping("/nhap-thong-tin-sinh-vien")
    public String addStudentInformationPage(Model model) {
        model.addAttribute("content", "staff/add-student-information");
        model.addAttribute("sidebar", "staff/staff-sidebar");

        return "home";
    }

    @RequestMapping(value = "/import-thong-tin-nhap-hoc", method = RequestMethod.POST, headers = "content-type=multipart/form-data")
    @ResponseBody
    public UploadResponse importStudentEntrollmentInformation(@RequestParam("file") MultipartFile file, Model model) {
        model.addAttribute("content", "staff/add-student-information");
        model.addAttribute("sidebar", "staff/staff-sidebar");

        UploadResponse response = new UploadResponse();
        if (!file.isEmpty()) {
            ByteArrayInputStream is = null;
            try {
                is = new ByteArrayInputStream(file.getBytes());
                AnnotatedExcelReport report = new AnnotatedExcelReport(is);
                List<StudentModel> listStudent = report.readData("com.project.fpt.sfm.processexcel.development.model.StudentModel");

                for (StudentModel studentDto : listStudent) {
                    System.out.println(studentDto);
                }

                response.setResult("OK");
            } catch (Exception e) {
                e.printStackTrace();
                response.setResult(e.toString());
            }
        } else {
            response.setResult("File Not Found");
        }

        return response;
    }



}
