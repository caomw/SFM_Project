package fpt.edu.vn.sfm.web;

import fpt.edu.vn.sfm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by Khắc Vỹ on 9/14/2015.
 */
@Controller
public class LoginController {

    @Autowired
    UserService userService;

    @RequestMapping("/login")
    public String loginPage(){

        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("error") String error){

        return "home";
    }
}
