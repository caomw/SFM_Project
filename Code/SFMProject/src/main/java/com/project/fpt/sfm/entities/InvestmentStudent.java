package com.project.fpt.sfm.entities;
// Generated Oct 8, 2015 2:49:22 PM by Hibernate Tools 4.3.1


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
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * InvestmentStudent generated by hbm2java
 */
@Entity
@Table(name="investment_student"
    ,catalog="sfm"
)
public class InvestmentStudent  implements java.io.Serializable {


     private int studentId;
     private Student student;
     private int investmentRate;
     private Set<InvestmentReport> investmentReports = new HashSet<InvestmentReport>(0);

    public InvestmentStudent() {
    }

	
    public InvestmentStudent(Student student, int investmentRate) {
        this.student = student;
        this.investmentRate = investmentRate;
    }
    public InvestmentStudent(Student student, int investmentRate, Set<InvestmentReport> investmentReports) {
       this.student = student;
       this.investmentRate = investmentRate;
       this.investmentReports = investmentReports;
    }
   
     @GenericGenerator(name="generator", strategy="foreign", parameters=@Parameter(name="property", value="student"))@Id @GeneratedValue(generator="generator")

    
    @Column(name="StudentID", unique=true, nullable=false)
    public int getStudentId() {
        return this.studentId;
    }
    
    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

@OneToOne(fetch=FetchType.LAZY)@PrimaryKeyJoinColumn
    public Student getStudent() {
        return this.student;
    }
    
    public void setStudent(Student student) {
        this.student = student;
    }

    
    @Column(name="InvestmentRate", nullable=false)
    public int getInvestmentRate() {
        return this.investmentRate;
    }
    
    public void setInvestmentRate(int investmentRate) {
        this.investmentRate = investmentRate;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="investmentStudent")
    public Set<InvestmentReport> getInvestmentReports() {
        return this.investmentReports;
    }
    
    public void setInvestmentReports(Set<InvestmentReport> investmentReports) {
        this.investmentReports = investmentReports;
    }




}

