package com.project.fpt.sfm.web.controller.staff;

import com.project.fpt.sfm.common.ExcelUtils;
import com.project.fpt.sfm.entities.Student;
import com.project.fpt.sfm.entities.Subject;
import com.project.fpt.sfm.processexcel.ParseStudentInformation;
import com.project.fpt.sfm.processexcel.ParseSubject;
import com.project.fpt.sfm.processexcel.model.StudentDto;
import com.project.fpt.sfm.service.StudentServiceImpl;
import com.project.fpt.sfm.service.SubjectService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Khắc Vỹ on 10/4/2015.
 */
@Controller
@RequestMapping("/staff")
public class StaffController {
    @Autowired
    StudentServiceImpl studentService;
    @Autowired
    SubjectService subjectService;

    @RequestMapping("")
    public String home(Model model) {
        model.addAttribute("content", "staff/staff-home");
        model.addAttribute("sidebar", "staff/staff-sidebar");

        return "home";
    }

    @RequestMapping("/nhap-thong-tin-sinh-vien")
    public String addStudentInformation(Model model) {
        model.addAttribute("content", "staff/add-student-information");
        model.addAttribute("sidebar", "staff/staff-sidebar");

        return "home";
    }

    @RequestMapping(value = "/upload-student-information", method = RequestMethod.POST)
    public String importStudentInformation(@RequestParam("file") MultipartFile file, Model model) {
        model.addAttribute("content", "staff/add-student-information");
        model.addAttribute("sidebar", "staff/staff-sidebar");

        if (!file.isEmpty()) {
            try {
                ParseStudentInformation parse = new ParseStudentInformation();
                List<StudentDto> list = parse.parseCurrentFile(file);
                for (StudentDto dto : list) {
                    studentService.addStudentInDevelopmentMode(dto);
                }

                model.addAttribute("error", "Upload Thành Công !");
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("error", "Something went wrong ! Please try again !");
            }
        } else {
            model.addAttribute("error", "File not found !!!");
        }

        return "home";
    }

    @RequestMapping("/download/student-information")
    public void downloadFile(HttpServletResponse response){
        List<Student> list = new ArrayList<>();
        Student student = new Student();
        list.add(student);

        Workbook workbook = ExcelUtils.writeExcelFile(list);
        try {
            response.setContentType("application/vnd.ms-excel");
            workbook.write(response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

//    Student finance Information

    @RequestMapping(value = "/upload-student-finance-information", method = RequestMethod.POST)
    public String importStudentFinanceInformation(@RequestParam("file") MultipartFile file, Model model) {
        model.addAttribute("content", "staff/add-student-information");
        model.addAttribute("sidebar", "staff/staff-sidebar");

        if (!file.isEmpty()) {
            try {
              /*  ParseStudentFinanceInformation parse = new ParseStudentFinanceInformation();
                List<SessionTuitionDto> list = parse.parseCurrentFile(file);
                for (SessionTuitionDto dto : list) {
                    System.out.println(dto);
                }*/
                ParseSubject parseSubject = new ParseSubject();
                List<Subject> list = parseSubject.parseCurrentFile(file);
                for(Subject s : list){
                    subjectService.addSubject(s);
                    //System.out.println(s);
                }

                model.addAttribute("error", "Upload Thành Công !");
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("error", "Something went wrong ! Please try again !");
            }
        } else {
            model.addAttribute("error", "File not found !!!");
        }

        return "home";
    }

    @RequestMapping("/nhap-ket-qua-hoc-tap")
    public String addStudyResult(Model model) {
        model.addAttribute("content", "staff/add-study-result");
        model.addAttribute("sidebar", "staff/staff-sidebar");

        return "home";
    }

    @RequestMapping("/nhap-thong-tin-tai-chinh")
    public String addStudentFinance(Model model) {
        model.addAttribute("content", "staff/add-finance-information");
        model.addAttribute("sidebar", "staff/staff-sidebar");

        return "home";
    }
}
