package com.project.fpt.sfm.service;

import com.project.fpt.sfm.common.Constant;
import com.project.fpt.sfm.entities.*;
import com.project.fpt.sfm.processexcel.model.StudentDto;
import com.project.fpt.sfm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Khắc Vỹ on 10/3/2015.
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    UserService userService;
    @Autowired
    StudentRepository studentRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    SemesterRepository semesterRepository;
    @Autowired
    StudentCourseRepository studentCourseRepository;
    @Autowired
    TuitionPaymentRepository tuitionPaymentRepository;
    @Autowired
    ResitCoursePaymentRepository resitCoursePaymentRepository;
    @Autowired
    TuitionRepository tuitionRepository;
    @Autowired
    ScholarshipStudentRepository scholarshipStudentRepository;
    @Autowired
    CreditStudentRepository creditStudentRepository;
    @Autowired
    InvestmentStudentRepository investmentStudentRepository;
    @Autowired
    StudyLevelRepository studyLevelRepository;

    @Override
    public void addStudentInDevelopmentMode(StudentDto studentDto) {
        /*

        System.out.println("Insert Student " + studentDto.getNo());
        *//**
         * Create User
         *//*
        User user = new User();
        user.setUsername(studentDto.getStudentCode());
        user.setPassword(Utils.generatePassword());
        user.setIsActive(true);
        user.setNote(studentDto.getNote());
        Set<Role> roles = new HashSet<>();
        Role studentRole = roleRepository.findByRoleName(Constant.ROLE_STUDENT);
        if (studentRole != null) {
            roles.add(studentRole);
        }
        *//**
         * Create Common Student
         *//*
        Student student = new Student();
        student.setStudentCode(studentDto.getStudentCode());
        student.setFullName(studentDto.getStudentName());
        student.setMajor(studentDto.getMajor());
        student.setTerm(studentDto.getTerm());
        student.setStudyStatus(studentDto.getStudentStatus());
        student.setNarrowSpecialization(studentDto.getSpecialize());
        *//**
         * Create Student Type
         *//*
        String financeType = studentDto.getFinanceType();
        if (!"".equals(financeType)) {
            String[] checkResult = Utils.checkStudentFinanceType(financeType);
            int rate = Integer.parseInt(checkResult[1]);
            if (checkResult[0].equals(Constant.FINANCE_TYPE_NVD) || checkResult[0].equals(Constant.FINANCE_TYPE_SCHOLARSHIP)) {
                Role scholarshipRole = roleRepository.findByRoleName(Constant.ROLE_SCHOLARSHIP_STUDENT);
                if (scholarshipRole != null) {
                    roles.add(scholarshipRole);
                }
                *//**
                 * Add Scholarship Student
                 *//*
                ScholarshipStudent scholarshipStudent = new ScholarshipStudent();
                scholarshipStudent.setScholarshipRate(rate);
                scholarshipStudent.setStudent(student);
                student.setScholarshipStudent(scholarshipStudent);
            } else if (checkResult[0].equals(Constant.FINANCE_TYPE_LOANS_CREDIT)) {
                Role loansCreditRole = roleRepository.findByRoleName(Constant.ROLE_LOANS_CREDIT_STUDENT);
                if (loansCreditRole != null) {
                    roles.add(loansCreditRole);
                }
                *//**
                 * Add Loans Credit Student
                 *//*
                LoansStudent loansStudent = new LoansStudent();
                loansStudent.setStudent(student);
                loansStudent.setLoansRate(rate);
                student.setLoansStudent(loansStudent);
            } else if (checkResult[0].equals(Constant.FINANCE_TYPE_INVESTING)) {
                Role investingRole = roleRepository.findByRoleName(Constant.ROLE_INVESTING_STUDENT);
                if (investingRole != null) {
                    roles.add(investingRole);
                }
                *//**
                 * Add Investing Student
                 *//*
                InvestingStudent investingStudent = new InvestingStudent();
                investingStudent.setStudent(student);
                investingStudent.setInvestingRate(rate);
                student.setInvestingStudent(investingStudent);

            } else {
                System.out.println("wtf");
            }
        }

        *//**
         * Set roles to user
         *//*
        user.setRoles(roles);
        user.setStudent(student);
        student.setUser(user);

        studentRepository.save(student);
        userRepository.save(user);

        System.out.println("Insert Student " + studentDto.getNo() + " Thanh Cong");
        */

    }

    @Override
    public Student getCurrentStudent() {
        org.springframework.security.core.userdetails.User loginUser = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (loginUser != null) {
            User user = userRepository.findByUsername(loginUser.getUsername());
            Student student = studentRepository.findOne(user.getUserId());
            return student;
        }
        return null;
    }

    /**
     * Get All Semester which studied by student
     *
     * @param student
     * @return
     */
    @Override
    public List<Semester> getListSemester(Student student) {
       // Sort sort = new Sort(Sort.Direction.ASC, "season.startDate");
        return semesterRepository.findByStudent(student);
    }

    /**
     * Get Semester by id
     *
     * @param semesterId
     * @return
     */
    @Override
    public Semester findSemesterById(int semesterId) {
        return semesterRepository.findOne(semesterId);
    }

    /**
     * Get List Courses of student in semester
     *
     * @param student
     * @param semester
     * @return
     */
    @Override
    public List<StudentCourse> getListCourseInSemester(Student student, Semester semester) {
       return studentCourseRepository.findByStudentAndSemester(student, semester);
    }

    /**
     * Get List Payment Of Student
     *
     * @param student
     * @return
     */
    @Override
    public List<TuitionPayment> getListTuitionPayment(Student student) {
        Sort sort = new Sort(Sort.Direction.DESC, "transferDate");
        return tuitionPaymentRepository.findByStudent(student, sort);
    }

    /**
     * Get List Resit course Of Student
     *
     * @param student
     * @return
     */
    @Override
    public List<ResitCoursePayment> getListResitCoursePayment(Student student) {
        return resitCoursePaymentRepository.findByStudent(student);
    }

    /**
     * Get List Tuition
     *
     * @return
     */
    @Override
    public List<Tuition> getListTuition() {
        return tuitionRepository.findAll();
    }

    /**
     * Get Financial Rate depend financial type of student
     *
     * @param student
     * @return
     */
    @Override
    public int getFinancialRateOfStudent(Student student) {
        int studentId = student.getStudentId();
        int rate = 0;
        String financialType = student.getFinancialType();
        switch (financialType) {
            case Constant.FINANCE_TYPE_NVD:
                rate = 100;
                break;
            case Constant.FINANCE_TYPE_SCHOLARSHIP:
                ScholarshipStudent scholarshipStudent = scholarshipStudentRepository.findOne(studentId);
                rate = scholarshipStudent.getScholarshipRate();
                break;
            case Constant.FINANCE_TYPE_LOANS_CREDIT:
                CreditStudent creditStudent = creditStudentRepository.findOne(studentId);
                rate = creditStudent.getCreditRate();
                break;
            case Constant.FINANCE_TYPE_INVESTING:
                InvestmentStudent investmentStudent = investmentStudentRepository.findOne(studentId);
                rate = investmentStudent.getInvestmentRate();
                break;
        }

        return rate;
    }

    /**
     * Get List Resit Course of student
     *
     * @param student
     * @return
     */
    @Override
    public List<StudentCourse> getListResitCourse(Student student) {
        Sort sort = new Sort(Sort.Direction.DESC, "semester");
        return studentCourseRepository.findByStudentAndIsPass(student, false, sort);
    }

    /**
     * Get Next Season Of Student
     *
     * @param student
     * @return
     */
    @Override
    public StudyLevel getNextStudyLevel(Student student) {
        Sort sort = new Sort(Sort.Direction.DESC, "semesterId");
        Semester semester = semesterRepository.findTop1ByStudent(student, sort);
        StudyLevel studyLevel = semester.getStudyLevel();
        StudyLevel nextLevel = studyLevelRepository.findOne(studyLevel.getStudyLevelId() + 1);
        if(nextLevel != null){
            return nextLevel;
        }
        return null;
    }

    /**
     * Get Failed Course of student
     *
     * @param student
     * @return
     */
    @Override
    public List<Subject> getFailedSubject(Student student) {
        /**
         * Lay Tat Ca Cac Mon Rot
         */
        List<StudentCourse> listFailedCourse = studentCourseRepository.findByStudentAndIsResitAndIsPass(student, false, false);
        List<Subject> listFailedSubject = new ArrayList<>();
        if(listFailedCourse.size() > 0){
            for(StudentCourse studentCourse : listFailedCourse){
                listFailedSubject.add(studentCourse.getCourse().getSubject());
            }
        }
        System.out.println("Faild : " + listFailedSubject.size());
        /**
         * Lay cac mon hoc lai va pass
          */
        List<StudentCourse> listPassedResitCourse = studentCourseRepository.findByStudentAndIsResitAndIsPass(student, true, true);
        List<Subject> listPassedResitSubject = new ArrayList<>();
        if(listPassedResitCourse.size() > 0){
            for(StudentCourse studentCourse : listPassedResitCourse){
                listPassedResitSubject.add(studentCourse.getCourse().getSubject());
            }
        }
        System.out.println("Resit Passed : " + listPassedResitSubject.size());
        /**
         *
         */
        if(listFailedSubject.size() > 0 && listPassedResitSubject.size() > 0){
           for(Subject subject : listPassedResitSubject){
               listFailedSubject.remove(subject);
           }
        }

        System.out.println("Result : " + listFailedSubject.size());

        return listFailedSubject;
    }

    /**
     * Get list of student who is studying
     *
     * @return
     */
    @Override
    public List<Student> getStudyingStudent() {
        return studentRepository.findByStudyStatus("ĐANG HỌC");
    }


}
