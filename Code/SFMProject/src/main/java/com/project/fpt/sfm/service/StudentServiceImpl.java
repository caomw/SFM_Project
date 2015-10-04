package com.project.fpt.sfm.service;

import com.project.fpt.sfm.common.Constant;
import com.project.fpt.sfm.common.StringUtils;
import com.project.fpt.sfm.entities.Role;
import com.project.fpt.sfm.entities.Student;
import com.project.fpt.sfm.entities.User;
import com.project.fpt.sfm.processexcel.model.StudentDto;
import com.project.fpt.sfm.repository.StudentRepository;
import com.project.fpt.sfm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Khắc Vỹ on 10/3/2015.
 */
@Service
public class StudentServiceImpl implements StudentService{
    @Autowired
    UserService userService;
    @Autowired
    StudentRepository studentRepository;
    @Autowired
    UserRepository userRepository;

    @Override
    public void addStudentInDevelopmentMode(StudentDto studentDto) {
        System.out.println("Insert Student " + studentDto.getNo());
        /**
         * Create User
         */
        User user = new User();
        user.setUsername(studentDto.getStudentCode());
        user.setPassword(StringUtils.generatePassword());
        user.setIsActive(true);
        user.setNote(studentDto.getNote());
        Set<Role> roles = new HashSet<>();
        Role studentRole = new Role(Constant.ROLE_STUDENT);
        roles.add(studentRole);
        /**
         * Create Common Student
         */
        Student student = new Student();
        student.setStudentCode(studentDto.getStudentCode());
        student.setFullName(studentDto.getStudentName());
        student.setMajor(studentDto.getMajor());
        student.setTerm(studentDto.getTerm());
        student.setClass_(studentDto.getClazz());
        student.setStudyStatus(studentDto.getStudentStatus());
        student.setSpecial(studentDto.getSpecialize());
        /**
         * Create Student Type
         */
        String financeType = studentDto.getFinanceType();
        if(!"".equals(financeType)){
            String[] checkResult = StringUtils.checkStudentFinanceType(financeType);
            if(checkResult[0].equals(Constant.FINANCE_TYPE_NVD) || checkResult[0].equals(Constant.FINANCE_TYPE_SCHOLARSHIP)){
                Role scholarshipRole = new Role(Constant.ROLE_SCHOLARSHIP_STUDENT);
                roles.add(scholarshipRole);
            }else if(checkResult[0].equals(Constant.FINANCE_TYPE_LOANS_CREDIT)){
                Role loansCreditRole = new Role(Constant.ROLE_LOANS_CREDIT_STUDENT);
                roles.add(loansCreditRole);
            }else if(checkResult[0].equals(Constant.FINANCE_TYPE_INVESTING)){
                Role investingRole = new Role(Constant.ROLE_INVESTING_STUDENT);
                roles.add(investingRole);
            }else{
                System.out.println("wtf");
            }
        }

        /**
         * Set roles to user
         */
        user.setRoles(roles);
        user.setStudent(student);
        student.setUser(user);

        studentRepository.save(student);
        userRepository.save(user);

        System.out.println("Insert Student " + studentDto.getNo() + " Thanh Cong");
    }
}
