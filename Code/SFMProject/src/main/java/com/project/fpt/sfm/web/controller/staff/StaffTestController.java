package com.project.fpt.sfm.web.controller.staff;

import com.project.fpt.sfm.entities.Subject;
import com.project.fpt.sfm.processexcel.model.SubjectDto;
import com.project.fpt.sfm.processexcel.utils.AnnotatedExcelReport;
import com.project.fpt.sfm.repository.SubjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.util.List;

/**
 * Created by Khắc Vỹ on 10/9/2015.
 */
@Controller
@RequestMapping("/staff/test")
public class StaffTestController {
    @Autowired
    SubjectRepository subjectRepository;

    @RequestMapping(value = "/subject", method = RequestMethod.POST)
    public String importSubject(@RequestParam("file") MultipartFile file, Model model){
        model.addAttribute("content", "staff/add-study-result");
        model.addAttribute("sidebar", "staff/staff-sidebar");

        if (!file.isEmpty()) {
            ByteArrayInputStream is = null;
            try {
                is = new ByteArrayInputStream(file.getBytes());
                AnnotatedExcelReport report = new AnnotatedExcelReport(is);
                List<SubjectDto> listSubject = report.readData("com.project.fpt.sfm.processexcel.model.SubjectDto");
                if(listSubject.size() > 0){
                    Subject subject;
                    for(SubjectDto subjectDto : listSubject){
                        System.out.println(subjectDto);
                        subject = subjectDto.toSubject();
                        if (subject != null){
                            subjectRepository.save(subject);
                        }
                    }
                }else{
                    System.out.println("Parse Error");
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
