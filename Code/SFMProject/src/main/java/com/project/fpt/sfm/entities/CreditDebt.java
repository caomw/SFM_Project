package com.project.fpt.sfm.entities;
// Generated Oct 8, 2015 2:49:22 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * CreditDebt generated by hbm2java
 */
@Entity
@Table(name="credit_debt"
    ,catalog="sfm"
)
public class CreditDebt  implements java.io.Serializable {


     private Integer creditDebtId;
     private CreditStudent creditStudent;
     private Integer interestRate;
     private String baseMoney;
     private String interest;
     private String totalInterest;
     private String note;
     private boolean isActive;

    public CreditDebt() {
    }

	
    public CreditDebt(CreditStudent creditStudent, String baseMoney, String interest, String totalInterest, boolean isActive) {
        this.creditStudent = creditStudent;
        this.baseMoney = baseMoney;
        this.interest = interest;
        this.totalInterest = totalInterest;
        this.isActive = isActive;
    }
    public CreditDebt(CreditStudent creditStudent, Integer interestRate, String baseMoney, String interest, String totalInterest, String note, boolean isActive) {
       this.creditStudent = creditStudent;
       this.interestRate = interestRate;
       this.baseMoney = baseMoney;
       this.interest = interest;
       this.totalInterest = totalInterest;
       this.note = note;
       this.isActive = isActive;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="CreditDebtID", unique=true, nullable=false)
    public Integer getCreditDebtId() {
        return this.creditDebtId;
    }
    
    public void setCreditDebtId(Integer creditDebtId) {
        this.creditDebtId = creditDebtId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="StudentID", nullable=false)
    public CreditStudent getCreditStudent() {
        return this.creditStudent;
    }
    
    public void setCreditStudent(CreditStudent creditStudent) {
        this.creditStudent = creditStudent;
    }

    
    @Column(name="InterestRate")
    public Integer getInterestRate() {
        return this.interestRate;
    }
    
    public void setInterestRate(Integer interestRate) {
        this.interestRate = interestRate;
    }

    
    @Column(name="BaseMoney", nullable=false, length=16777215)
    public String getBaseMoney() {
        return this.baseMoney;
    }
    
    public void setBaseMoney(String baseMoney) {
        this.baseMoney = baseMoney;
    }

    
    @Column(name="Interest", nullable=false, length=16777215)
    public String getInterest() {
        return this.interest;
    }
    
    public void setInterest(String interest) {
        this.interest = interest;
    }

    
    @Column(name="TotalInterest", nullable=false, length=16777215)
    public String getTotalInterest() {
        return this.totalInterest;
    }
    
    public void setTotalInterest(String totalInterest) {
        this.totalInterest = totalInterest;
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

