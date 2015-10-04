package com.project.fpt.sfm.service;

import com.project.fpt.sfm.entities.Role;
import com.project.fpt.sfm.entities.User;
import com.project.fpt.sfm.processexcel.model.StudentDto;
import com.project.fpt.sfm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * Created by Khắc Vỹ on 10/4/2015.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService{
    @Autowired
    UserRepository userRepository;

    @Override
    public void addStudentInDevelopMode(StudentDto studentDto) {

    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addUser(String username, String password, String note, boolean isActive, List<Role> roles) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setNote(note);
        user.setIsActive(isActive);
        user.setRoles(new HashSet<Role>(roles));

        userRepository.save(user);
    }
}
