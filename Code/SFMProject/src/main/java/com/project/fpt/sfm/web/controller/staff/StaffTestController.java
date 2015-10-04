package com.project.fpt.sfm.web.controller.staff;

import com.project.fpt.sfm.entities.Student;
import com.project.fpt.sfm.processexcel.ParseStudentInformation;
import com.project.fpt.sfm.processexcel.model.StudentDto;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by Khắc Vỹ on 10/4/2015.
 */
@RequestMapping("/test/staff")
@Controller
public class StaffTestController {

    @RequestMapping("/")
    public String staffUpload(){
        return "upload";
    }

    @RequestMapping(value = "/student-information", method = RequestMethod.POST)
    public
    @ResponseBody
    String studentInformation(@RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                ParseStudentInformation parse = new ParseStudentInformation();
                List<StudentDto> list = parse.parseCurrentFile(file);

                return "parse successful . Size : " + list.size();
            } catch (Exception e) {
                return "error : " + e.toString();
            }
        } else {
            return "File Not Found";
        }
    }

}
