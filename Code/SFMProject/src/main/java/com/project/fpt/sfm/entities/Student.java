package com.project.fpt.sfm.entities;
// Generated Oct 9, 2015 2:20:41 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * Student generated by hbm2java
 */
@Entity
@Table(name="student"
        ,catalog="sfm"
        , uniqueConstraints = {@UniqueConstraint(columnNames="StudentCode"), @UniqueConstraint(columnNames="SSN")}
)
public class Student  implements java.io.Serializable {


    private Integer studentId;
    private User user;
    private Major major;
    private String fullName;
    private String studentCode;
    private boolean gender;
    private Date dateOfBirth;
    private String email;
    private String ssn;
    private String phoneNumber;
    private String address;
    private String financialType;
    private int financialRate;
    private boolean isGraduated;
    private String studyStatus;
    private String subMajor;
    private String term;
    private String narrowSpecialization;
    private String parentPhone;
    private String parentEmail;
    private Set<TuitionPlan> tuitionPlans = new HashSet<TuitionPlan>(0);
    private ScholarshipStudent scholarshipStudent;
    private InvestmentStudent investmentStudent;
    private Set<ResitCoursePayment> resitCoursePayments = new HashSet<ResitCoursePayment>(0);
    private Set<Semester> semesters = new HashSet<Semester>(0);
    private Set<TuitionPayment> tuitionPayments = new HashSet<TuitionPayment>(0);
    private Set<StudentCourse> studentCourses = new HashSet<StudentCourse>(0);
    private CreditStudent creditStudent;

    public Student() {
    }


    public Student(User user, Major major, String fullName, String studentCode, boolean gender, String email, String ssn, String financialType, int financialRate, boolean isGraduated, String studyStatus, String subMajor, String term, String narrowSpecialization) {
        this.user = user;
        this.major = major;
        this.fullName = fullName;
        this.studentCode = studentCode;
        this.gender = gender;
        this.email = email;
        this.ssn = ssn;
        this.financialType = financialType;
        this.financialRate = financialRate;
        this.isGraduated = isGraduated;
        this.studyStatus = studyStatus;
        this.subMajor = subMajor;
        this.term = term;
        this.narrowSpecialization = narrowSpecialization;
    }
    public Student(User user, Major major, String fullName, String studentCode, boolean gender, Date dateOfBirth, String email, String ssn, String phoneNumber, String address, String financialType, int financialRate, boolean isGraduated, String studyStatus, String subMajor, String term, String narrowSpecialization, String parentPhone, String parentEmail, Set<TuitionPlan> tuitionPlans, ScholarshipStudent scholarshipStudent, InvestmentStudent investmentStudent, Set<ResitCoursePayment> resitCoursePayments, Set<Semester> semesters, Set<TuitionPayment> tuitionPayments, Set<StudentCourse> studentCourses, CreditStudent creditStudent) {
        this.user = user;
        this.major = major;
        this.fullName = fullName;
        this.studentCode = studentCode;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
        this.ssn = ssn;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.financialType = financialType;
        this.financialRate = financialRate;
        this.isGraduated = isGraduated;
        this.studyStatus = studyStatus;
        this.subMajor = subMajor;
        this.term = term;
        this.narrowSpecialization = narrowSpecialization;
        this.parentPhone = parentPhone;
        this.parentEmail = parentEmail;
        this.tuitionPlans = tuitionPlans;
        this.scholarshipStudent = scholarshipStudent;
        this.investmentStudent = investmentStudent;
        this.resitCoursePayments = resitCoursePayments;
        this.semesters = semesters;
        this.tuitionPayments = tuitionPayments;
        this.studentCourses = studentCourses;
        this.creditStudent = creditStudent;
    }

    @GenericGenerator(name="generator", strategy="foreign", parameters=@Parameter(name="property", value="user"))@Id @GeneratedValue(generator="generator")


    @Column(name="StudentID", unique=true, nullable=false)
    public Integer getStudentId() {
        return this.studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    @OneToOne(fetch=FetchType.LAZY)@PrimaryKeyJoinColumn
    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="MajorID", nullable=false)
    public Major getMajor() {
        return this.major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }


    @Column(name="FullName", nullable=false, length=64)
    public String getFullName() {
        return this.fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }


    @Column(name="StudentCode", unique=true, nullable=false, length=10)
    public String getStudentCode() {
        return this.studentCode;
    }

    public void setStudentCode(String studentCode) {
        this.studentCode = studentCode;
    }


    @Column(name="Gender", nullable=false)
    public boolean isGender() {
        return this.gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="DateOfBirth", length=19)
    public Date getDateOfBirth() {
        return this.dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }


    @Column(name="Email", nullable=false)
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    @Column(name="SSN", unique=true, nullable=false, length=10)
    public String getSsn() {
        return this.ssn;
    }

    public void setSsn(String ssn) {
        this.ssn = ssn;
    }


    @Column(name="PhoneNumber", length=15)
    public String getPhoneNumber() {
        return this.phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }


    @Column(name="Address", length=65535)
    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    @Column(name="FinancialType", nullable=false, length=15)
    public String getFinancialType() {
        return this.financialType;
    }

    public void setFinancialType(String financialType) {
        this.financialType = financialType;
    }


    @Column(name="FinancialRate", nullable=false)
    public int getFinancialRate() {
        return this.financialRate;
    }

    public void setFinancialRate(int financialRate) {
        this.financialRate = financialRate;
    }


    @Column(name="IsGraduated", nullable=false)
    public boolean isIsGraduated() {
        return this.isGraduated;
    }

    public void setIsGraduated(boolean isGraduated) {
        this.isGraduated = isGraduated;
    }


    @Column(name="StudyStatus", nullable=false, length=30)
    public String getStudyStatus() {
        return this.studyStatus;
    }

    public void setStudyStatus(String studyStatus) {
        this.studyStatus = studyStatus;
    }


    @Column(name="SubMajor", nullable=false, length=45)
    public String getSubMajor() {
        return this.subMajor;
    }

    public void setSubMajor(String subMajor) {
        this.subMajor = subMajor;
    }


    @Column(name="Term", nullable=false, length=10)
    public String getTerm() {
        return this.term;
    }

    public void setTerm(String term) {
        this.term = term;
    }


    @Column(name="NarrowSpecialization", nullable=false, length=20)
    public String getNarrowSpecialization() {
        return this.narrowSpecialization;
    }

    public void setNarrowSpecialization(String narrowSpecialization) {
        this.narrowSpecialization = narrowSpecialization;
    }


    @Column(name="ParentPhone", length=15)
    public String getParentPhone() {
        return this.parentPhone;
    }

    public void setParentPhone(String parentPhone) {
        this.parentPhone = parentPhone;
    }


    @Column(name="ParentEmail")
    public String getParentEmail() {
        return this.parentEmail;
    }

    public void setParentEmail(String parentEmail) {
        this.parentEmail = parentEmail;
    }

    @OneToMany(fetch=FetchType.LAZY, mappedBy="student")
    @Cascade(CascadeType.ALL)
    public Set<TuitionPlan> getTuitionPlans() {
        return this.tuitionPlans;
    }

    public void setTuitionPlans(Set<TuitionPlan> tuitionPlans) {
        this.tuitionPlans = tuitionPlans;
    }

    @OneToOne(fetch=FetchType.LAZY, mappedBy="student")
    public ScholarshipStudent getScholarshipStudent() {
        return this.scholarshipStudent;
    }

    public void setScholarshipStudent(ScholarshipStudent scholarshipStudent) {
        this.scholarshipStudent = scholarshipStudent;
    }

    @OneToOne(fetch=FetchType.LAZY, mappedBy="student")
    public InvestmentStudent getInvestmentStudent() {
        return this.investmentStudent;
    }

    public void setInvestmentStudent(InvestmentStudent investmentStudent) {
        this.investmentStudent = investmentStudent;
    }

    @OneToMany(fetch=FetchType.LAZY, mappedBy="student")
    public Set<ResitCoursePayment> getResitCoursePayments() {
        return this.resitCoursePayments;
    }

    public void setResitCoursePayments(Set<ResitCoursePayment> resitCoursePayments) {
        this.resitCoursePayments = resitCoursePayments;
    }

    @OneToMany(fetch=FetchType.LAZY, mappedBy="student")
    public Set<Semester> getSemesters() {
        return this.semesters;
    }

    public void setSemesters(Set<Semester> semesters) {
        this.semesters = semesters;
    }

    @OneToMany(fetch=FetchType.LAZY, mappedBy="student")
    public Set<TuitionPayment> getTuitionPayments() {
        return this.tuitionPayments;
    }

    public void setTuitionPayments(Set<TuitionPayment> tuitionPayments) {
        this.tuitionPayments = tuitionPayments;
    }

    @OneToMany(fetch=FetchType.LAZY, mappedBy="student")
    public Set<StudentCourse> getStudentCourses() {
        return this.studentCourses;
    }

    public void setStudentCourses(Set<StudentCourse> studentCourses) {
        this.studentCourses = studentCourses;
    }

    @OneToOne(fetch=FetchType.LAZY, mappedBy="student")
    public CreditStudent getCreditStudent() {
        return this.creditStudent;
    }

    public void setCreditStudent(CreditStudent creditStudent) {
        this.creditStudent = creditStudent;
    }




}


