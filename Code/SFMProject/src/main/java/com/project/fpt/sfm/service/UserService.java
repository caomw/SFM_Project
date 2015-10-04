package com.project.fpt.sfm.service;

import com.project.fpt.sfm.entities.Role;
import com.project.fpt.sfm.processexcel.model.StudentDto;

import java.util.List;

/**
 * Created by Khắc Vỹ on 10/4/2015.
 */
public interface UserService {
    void addStudentInDevelopMode(StudentDto studentDto);

    void addUser(String username, String password,String note, boolean isActive, List<Role> roles);
}
