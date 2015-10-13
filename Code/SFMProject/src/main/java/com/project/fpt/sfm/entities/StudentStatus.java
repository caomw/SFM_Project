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
 * StudentStatus generated by hbm2java
 */
@Entity
@Table(name="student_status"
    ,catalog="sfm"
)
public class StudentStatus  implements java.io.Serializable {


     private Integer studentStatusId;
     private String statusName;
     private String note;
     private Boolean isActive;
     private Date dateCreated;
     private Date dateUpdated;
     private Set<Student> students = new HashSet<Student>(0);

    public StudentStatus() {
    }

	
    public StudentStatus(String statusName) {
        this.statusName = statusName;
    }
    public StudentStatus(String statusName, String note, Boolean isActive, Date dateCreated, Date dateUpdated, Set<Student> students) {
       this.statusName = statusName;
       this.note = note;
       this.isActive = isActive;
       this.dateCreated = dateCreated;
       this.dateUpdated = dateUpdated;
       this.students = students;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="StudentStatusID", unique=true, nullable=false)
    public Integer getStudentStatusId() {
        return this.studentStatusId;
    }
    
    public void setStudentStatusId(Integer studentStatusId) {
        this.studentStatusId = studentStatusId;
    }

    
    @Column(name="StatusName", nullable=false, length=45)
    public String getStatusName() {
        return this.statusName;
    }
    
    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    
    @Column(name="Note", length=65535)
    public String getNote() {
        return this.note;
    }
    
    public void setNote(String note) {
        this.note = note;
    }

    
    @Column(name="IsActive")
    public Boolean getIsActive() {
        return this.isActive;
    }
    
    public void setIsActive(Boolean isActive) {
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

@OneToMany(fetch=FetchType.LAZY, mappedBy="studentStatus")
    public Set<Student> getStudents() {
        return this.students;
    }
    
    public void setStudents(Set<Student> students) {
        this.students = students;
    }




}

