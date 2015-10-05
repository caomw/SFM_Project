package com.project.fpt.sfm.entities;
// Generated Oct 5, 2015 2:12:53 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
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
    , uniqueConstraints = @UniqueConstraint(columnNames="StudentCode") 
)
public class Student  implements java.io.Serializable {


     private Integer studentId;
     private User user;
     private String fullName;
     private String studentCode;
     private Boolean gender;
     private Date dateOfBirth;
     private String email;
     private String ssn;
     private String phoneNumber;
     private String address;
     private String major;
     private Boolean isGraduated;
     private String studyStatus;
     private String subMajor;
     private String term;
     private String narrowSpecialization;
     private String parentPhone;
     private String parentEmail;
     private ScholarshipStudent scholarshipStudent;
     private InvestingStudent investingStudent;
     private Set<StudySession> studySessions = new HashSet<StudySession>(0);
     private LoansStudent loansStudent;

    public Student() {
    }

	
    public Student(User user) {
        this.user = user;
    }
    public Student(User user, String fullName, String studentCode, Boolean gender, Date dateOfBirth, String email, String ssn, String phoneNumber, String address, String major, Boolean isGraduated, String studyStatus, String subMajor, String term, String narrowSpecialization, String parentPhone, String parentEmail, ScholarshipStudent scholarshipStudent, InvestingStudent investingStudent, Set<StudySession> studySessions, LoansStudent loansStudent) {
       this.user = user;
       this.fullName = fullName;
       this.studentCode = studentCode;
       this.gender = gender;
       this.dateOfBirth = dateOfBirth;
       this.email = email;
       this.ssn = ssn;
       this.phoneNumber = phoneNumber;
       this.address = address;
       this.major = major;
       this.isGraduated = isGraduated;
       this.studyStatus = studyStatus;
       this.subMajor = subMajor;
       this.term = term;
       this.narrowSpecialization = narrowSpecialization;
       this.parentPhone = parentPhone;
       this.parentEmail = parentEmail;
       this.scholarshipStudent = scholarshipStudent;
       this.investingStudent = investingStudent;
       this.studySessions = studySessions;
       this.loansStudent = loansStudent;
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

    
    @Column(name="FullName", length=64)
    public String getFullName() {
        return this.fullName;
    }
    
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    
    @Column(name="StudentCode", unique=true, length=10)
    public String getStudentCode() {
        return this.studentCode;
    }
    
    public void setStudentCode(String studentCode) {
        this.studentCode = studentCode;
    }

    
    @Column(name="Gender")
    public Boolean getGender() {
        return this.gender;
    }
    
    public void setGender(Boolean gender) {
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

    
    @Column(name="Email")
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    
    @Column(name="SSN", length=10)
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

    
    @Column(name="Major", length=20)
    public String getMajor() {
        return this.major;
    }
    
    public void setMajor(String major) {
        this.major = major;
    }

    
    @Column(name="IsGraduated")
    public Boolean getIsGraduated() {
        return this.isGraduated;
    }
    
    public void setIsGraduated(Boolean isGraduated) {
        this.isGraduated = isGraduated;
    }

    
    @Column(name="StudyStatus", length=30)
    public String getStudyStatus() {
        return this.studyStatus;
    }
    
    public void setStudyStatus(String studyStatus) {
        this.studyStatus = studyStatus;
    }

    
    @Column(name="SubMajor", length=45)
    public String getSubMajor() {
        return this.subMajor;
    }
    
    public void setSubMajor(String subMajor) {
        this.subMajor = subMajor;
    }

    
    @Column(name="Term", length=10)
    public String getTerm() {
        return this.term;
    }
    
    public void setTerm(String term) {
        this.term = term;
    }

    
    @Column(name="NarrowSpecialization", length=20)
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

@OneToOne(fetch=FetchType.LAZY, mappedBy="student")
@Cascade(CascadeType.ALL)
    public ScholarshipStudent getScholarshipStudent() {
        return this.scholarshipStudent;
    }
    
    public void setScholarshipStudent(ScholarshipStudent scholarshipStudent) {
        this.scholarshipStudent = scholarshipStudent;
    }

@OneToOne(fetch=FetchType.LAZY, mappedBy="student")
@Cascade(CascadeType.ALL)
    public InvestingStudent getInvestingStudent() {
        return this.investingStudent;
    }
    
    public void setInvestingStudent(InvestingStudent investingStudent) {
        this.investingStudent = investingStudent;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="student")
    public Set<StudySession> getStudySessions() {
        return this.studySessions;
    }
    
    public void setStudySessions(Set<StudySession> studySessions) {
        this.studySessions = studySessions;
    }

@OneToOne(fetch=FetchType.LAZY, mappedBy="student")
@Cascade(CascadeType.ALL)
    public LoansStudent getLoansStudent() {
        return this.loansStudent;
    }
    
    public void setLoansStudent(LoansStudent loansStudent) {
        this.loansStudent = loansStudent;
    }




}


