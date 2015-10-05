package com.project.fpt.sfm.service;

import com.project.fpt.sfm.common.Constant;
import com.project.fpt.sfm.common.StringUtils;
import com.project.fpt.sfm.entities.*;
import com.project.fpt.sfm.processexcel.model.StudentDto;
import com.project.fpt.sfm.repository.RoleRepository;
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
    @Autowired
    RoleRepository roleRepository;

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
        Role studentRole = roleRepository.findByRoleName(Constant.ROLE_STUDENT);
        if(studentRole != null) {
            roles.add(studentRole);
        }
        /**
         * Create Common Student
         */
        Student student = new Student();
        student.setStudentCode(studentDto.getStudentCode());
        student.setFullName(studentDto.getStudentName());
        student.setMajor(studentDto.getMajor());
        student.setTerm(studentDto.getTerm());
        student.setStudyStatus(studentDto.getStudentStatus());
        student.setNarrowSpecialization(studentDto.getSpecialize());
        /**
         * Create Student Type
         */
        String financeType = studentDto.getFinanceType();
        if(!"".equals(financeType)){
            String[] checkResult = StringUtils.checkStudentFinanceType(financeType);
            int rate = Integer.parseInt(checkResult[1]);
            if(checkResult[0].equals(Constant.FINANCE_TYPE_NVD) || checkResult[0].equals(Constant.FINANCE_TYPE_SCHOLARSHIP)){
                Role scholarshipRole = roleRepository.findByRoleName(Constant.ROLE_SCHOLARSHIP_STUDENT);
                if(scholarshipRole != null){
                    roles.add(scholarshipRole);
                }
                /**
                 * Add Scholarship Student
                 */
                ScholarshipStudent scholarshipStudent = new ScholarshipStudent();
                scholarshipStudent.setScholarshipRate(rate);
                scholarshipStudent.setStudent(student);
                student.setScholarshipStudent(scholarshipStudent);
            }else if(checkResult[0].equals(Constant.FINANCE_TYPE_LOANS_CREDIT)){
                Role loansCreditRole =  roleRepository.findByRoleName(Constant.ROLE_LOANS_CREDIT_STUDENT);
                if(loansCreditRole != null){
                    roles.add(loansCreditRole);
                }
                /**
                 * Add Loans Credit Student
                 */
                LoansStudent loansStudent = new LoansStudent();
                loansStudent.setStudent(student);
                loansStudent.setLoansRate(rate);
                student.setLoansStudent(loansStudent);
            }else if(checkResult[0].equals(Constant.FINANCE_TYPE_INVESTING)){
                Role investingRole = roleRepository.findByRoleName(Constant.ROLE_INVESTING_STUDENT);
                if(investingRole != null){
                    roles.add(investingRole);
                }
                /**
                 * Add Investing Student
                 */
                InvestingStudent investingStudent = new InvestingStudent();
                investingStudent.setStudent(student);
                investingStudent.setInvestingRate(rate);
                student.setInvestingStudent(investingStudent);

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
