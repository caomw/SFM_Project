package fpt.edu.vn.sfm.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by Khắc Vỹ on 9/14/2015.
 */
@Controller
public class LoginController {

    @RequestMapping("/login")
    public String loginPage(){

        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(
            @RequestParam("username") String username,
            @RequestParam("password") String password){

        return "home";
    }
}
