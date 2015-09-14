package fpt.edu.vn.sfm.service;

import fpt.edu.vn.sfm.model.Role;
import fpt.edu.vn.sfm.model.SystemUser;
import fpt.edu.vn.sfm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Created by Khắc Vỹ on 9/14/2015.
 */
@Service
@Transactional
public class UserService implements UserDetailsService{
    @Autowired
    UserRepository userRepository;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SystemUser user = userRepository.findByUsername(username);
        User _user =  buildUserForAuthentication(user);

        System.out.println("Role : " + _user.getAuthorities().iterator().next().getAuthority());

        return _user;
    }

    private User buildUserForAuthentication(SystemUser sysUser){
        return new User(sysUser.getUsername(), sysUser.getPassword(), buildUserAuthority(sysUser));
    }

    private List<GrantedAuthority> buildUserAuthority(SystemUser user){
        List<GrantedAuthority> result = new ArrayList<>();

        result.add(new SimpleGrantedAuthority(user.getRole().getRoleName()));

        return result;
    }

}
