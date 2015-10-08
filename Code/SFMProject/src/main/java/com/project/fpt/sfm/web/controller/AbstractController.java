package com.project.fpt.sfm.web.controller;

import com.project.fpt.sfm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;

/**
 * Created by Khoa on 10/9/2015.
 */
public abstract class AbstractController {

    @Autowired
    UserService userService;

    public User getLoginUser() {
        return (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
