package com.project.fpt.sfm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Khắc Vỹ on 9/16/2015.
 */
@Controller
public class HomeController {

    @RequestMapping("/home")
    public String homePage(){
        return "home";
    }
}
