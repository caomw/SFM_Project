package fpt.edu.vn.sfm.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Khắc Vỹ on 9/14/2015.
 */
@Controller
public class HomeController {

    @RequestMapping("/home")
    public String homePage(Model model){
        //model.addAttribute("user", )

        return "home";
    }

    @RequestMapping("/student")
    public String student(Model model){
        return "student";
    }

    @RequestMapping("/staff")
    public String staff(Model model){
        return "staff";
    }

    @RequestMapping("/manager")
    public String manager(Model model){
        return "manager";
    }

    @RequestMapping("/403")
    public String accessDeniedPage(Model model){
        return "403";
    }

}
