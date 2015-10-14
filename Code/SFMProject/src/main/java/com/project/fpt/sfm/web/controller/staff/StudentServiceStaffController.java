package com.project.fpt.sfm.web.controller.staff;

import com.project.fpt.sfm.common.Constant;
import com.project.fpt.sfm.common.Utils;
import com.project.fpt.sfm.entities.Student;
import com.project.fpt.sfm.entities.Subject;
import com.project.fpt.sfm.entities.Term;
import com.project.fpt.sfm.entities.TuitionPlan;
import com.project.fpt.sfm.processexcel.development.ExcelParser;
import com.project.fpt.sfm.processexcel.development.model.StudentModel;
import com.project.fpt.sfm.processexcel.model.StudentDto;
import com.project.fpt.sfm.processexcel.model.StudentTemplate;
import com.project.fpt.sfm.processexcel.model.SubjectDto;
import com.project.fpt.sfm.processexcel.utils.AnnotatedExcelReport;
import com.project.fpt.sfm.repository.TuitionPlanRepo;
import com.project.fpt.sfm.service.AdminService;
import com.project.fpt.sfm.service.StudentService;
import com.project.fpt.sfm.web.response.UploadResponse;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.util.Date;
import java.util.List;

/**
 * Created by Khắc Vỹ on 10/12/2015.
 */
@Controller
@RequestMapping("/nhan-vien/cong-tac-sinh-vien")
public class StudentServiceStaffController {
    @Autowired
    StudentService studentService;
    @Autowired
    TaskScheduler taskScheduler;
    @Autowired
    AdminService adminService;
    @Autowired
    TuitionPlanRepo tuitionPlanRepo;

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
    public UploadResponse importStudentEntrollmentInformation(@RequestParam("file") MultipartFile file) {
        UploadResponse response = new UploadResponse();
        if (!file.isEmpty()) {
            try {
                ExcelParser parser = new ExcelParser();
                List<StudentModel> listStudentModel = parser.parseStudentInformation(file);
                if(listStudentModel.size() > 0){
                    for(StudentModel model : listStudentModel){
                        if(!model.getStudentCode().equals("")){
                            studentService.addNewStudent(model);
                        }
                    }
                }
                response.setResult("OK");
            } catch (InvalidFormatException e) {
                e.printStackTrace();
            }
        } else {
            response.setResult("File Not Found");
        }

        return response;
    }
}
