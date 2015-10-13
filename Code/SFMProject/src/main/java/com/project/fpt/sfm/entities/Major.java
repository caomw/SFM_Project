package com.project.fpt.sfm.entities;
// Generated Oct 12, 2015 1:43:11 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Major generated by hbm2java
 */
@Entity
@Table(name="major"
    ,catalog="sfm"
)
public class Major  implements java.io.Serializable {


     private Integer majorId;
     private String majorCode;
     private String majorName;
     private String note;
     private boolean isActive;
     private Date dateCreated;
     private Date dateUpdated;
     private Set<Student> students = new HashSet<Student>(0);

    public Major() {
    }

	
    public Major(String majorCode, String majorName, boolean isActive) {
        this.majorCode = majorCode;
        this.majorName = majorName;
        this.isActive = isActive;
    }
    public Major(String majorCode, String majorName, String note, boolean isActive, Date dateCreated, Date dateUpdated, Set<Student> students) {
       this.majorCode = majorCode;
       this.majorName = majorName;
       this.note = note;
       this.isActive = isActive;
       this.dateCreated = dateCreated;
       this.dateUpdated = dateUpdated;
       this.students = students;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="MajorID", unique=true, nullable=false)
    public Integer getMajorId() {
        return this.majorId;
    }
    
    public void setMajorId(Integer majorId) {
        this.majorId = majorId;
    }

    
    @Column(name="MajorCode", nullable=false, length=10)
    public String getMajorCode() {
        return this.majorCode;
    }
    
    public void setMajorCode(String majorCode) {
        this.majorCode = majorCode;
    }

    
    @Column(name="MajorName", nullable=false, length=45)
    public String getMajorName() {
        return this.majorName;
    }
    
    public void setMajorName(String majorName) {
        this.majorName = majorName;
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

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="Date_Created", length=19)
    public Date getDateCreated() {
        return this.dateCreated;
    }
    
    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="DateUpdated", length=19)
    public Date getDateUpdated() {
        return this.dateUpdated;
    }
    
    public void setDateUpdated(Date dateUpdated) {
        this.dateUpdated = dateUpdated;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="major")
    public Set<Student> getStudents() {
        return this.students;
    }
    
    public void setStudents(Set<Student> students) {
        this.students = students;
    }




}


