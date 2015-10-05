package com.project.fpt.sfm.entities;
// Generated Oct 5, 2015 2:12:53 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * StudentResitCourse generated by hbm2java
 */
@Entity
@Table(name="student_resit_course"
    ,catalog="sfm"
)
public class StudentResitCourse  implements java.io.Serializable {


     private int studentCourseId;
     private StudentCourse studentCourse;
     private String totalMoney;
     private String mustPayMoney;
     private String paidMoney;
     private boolean payStatus;
     private String note;
     private boolean isActive;

    public StudentResitCourse() {
    }

	
    public StudentResitCourse(StudentCourse studentCourse, String totalMoney, String mustPayMoney, String paidMoney, boolean payStatus, boolean isActive) {
        this.studentCourse = studentCourse;
        this.totalMoney = totalMoney;
        this.mustPayMoney = mustPayMoney;
        this.paidMoney = paidMoney;
        this.payStatus = payStatus;
        this.isActive = isActive;
    }
    public StudentResitCourse(StudentCourse studentCourse, String totalMoney, String mustPayMoney, String paidMoney, boolean payStatus, String note, boolean isActive) {
       this.studentCourse = studentCourse;
       this.totalMoney = totalMoney;
       this.mustPayMoney = mustPayMoney;
       this.paidMoney = paidMoney;
       this.payStatus = payStatus;
       this.note = note;
       this.isActive = isActive;
    }
   
     @GenericGenerator(name="generator", strategy="foreign", parameters=@Parameter(name="property", value="studentCourse"))@Id @GeneratedValue(generator="generator")

    
    @Column(name="StudentCourseID", unique=true, nullable=false)
    public int getStudentCourseId() {
        return this.studentCourseId;
    }
    
    public void setStudentCourseId(int studentCourseId) {
        this.studentCourseId = studentCourseId;
    }

@OneToOne(fetch=FetchType.LAZY)@PrimaryKeyJoinColumn
    public StudentCourse getStudentCourse() {
        return this.studentCourse;
    }
    
    public void setStudentCourse(StudentCourse studentCourse) {
        this.studentCourse = studentCourse;
    }

    
    @Column(name="TotalMoney", nullable=false, length=16777215)
    public String getTotalMoney() {
        return this.totalMoney;
    }
    
    public void setTotalMoney(String totalMoney) {
        this.totalMoney = totalMoney;
    }

    
    @Column(name="MustPayMoney", nullable=false, length=16777215)
    public String getMustPayMoney() {
        return this.mustPayMoney;
    }
    
    public void setMustPayMoney(String mustPayMoney) {
        this.mustPayMoney = mustPayMoney;
    }

    
    @Column(name="PaidMoney", nullable=false, length=16777215)
    public String getPaidMoney() {
        return this.paidMoney;
    }
    
    public void setPaidMoney(String paidMoney) {
        this.paidMoney = paidMoney;
    }

    
    @Column(name="PayStatus", nullable=false)
    public boolean isPayStatus() {
        return this.payStatus;
    }
    
    public void setPayStatus(boolean payStatus) {
        this.payStatus = payStatus;
    }

    
    @Column(name="Note", length=65535)
    public String getNote() {
        return this.note;
    }
    
    public void setNote(String note) {
        this.note = note;
    }

    
    @Column(name="IsActive", nullable=false)
    public boolean isIsActive() {
        return this.isActive;
    }
    
    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }




}


