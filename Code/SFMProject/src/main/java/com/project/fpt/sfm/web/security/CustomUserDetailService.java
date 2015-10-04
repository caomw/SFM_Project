package com.project.fpt.sfm.web.security;

import com.project.fpt.sfm.entities.Role;
import com.project.fpt.sfm.entities.User;
import com.project.fpt.sfm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Khắc Vỹ on 10/4/2015.
 */
@Service
@Transactional
public class CustomUserDetailService implements UserDetailsService{
    @Autowired
    UserRepository userRepository;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User loginUser = userRepository.findByUsername(username);
        if(loginUser != null){
            org.springframework.security.core.userdetails.User user = buildUserForAuthentication(loginUser);
            return user;
        }else{
            return null;
        }
    }

    private org.springframework.security.core.userdetails.User buildUserForAuthentication(User user){
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), buildUserAuthority(user));
    }

    private List<GrantedAuthority> buildUserAuthority(User user){
        List<GrantedAuthority> result = new ArrayList<>();

        for(Role role : user.getRoles()){
            result.add(new SimpleGrantedAuthority(role.getRoleName()));
        }

        return result;
    }
}
