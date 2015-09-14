package fpt.edu.vn.sfm.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by Khắc Vỹ on 9/14/2015.
 */
@Controller
public class LoginController {

    @RequestMapping("/login")
    public String loginPage(@RequestParam(value = "error", required = false) String error, Model model){
        model.addAttribute("error", error);

        return "login";
    }
}
