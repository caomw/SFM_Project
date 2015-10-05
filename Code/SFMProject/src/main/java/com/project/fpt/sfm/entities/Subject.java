package com.project.fpt.sfm.entities;
// Generated Oct 5, 2015 2:12:53 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Subject generated by hbm2java
 */
@Entity
@Table(name="subject"
    ,catalog="sfm"
)
public class Subject  implements java.io.Serializable {


     private Integer subjectId;
     private SubjectCategory subjectCategory;
     private String subjectNameE;
     private String subjectNameV;
     private String subjectCode;
     private int numOfCredit;
     private String type;
     private String note;
     private boolean isActive;
     private int numOfLesson;
     private Set<Subject> subjectsForSubjectId = new HashSet<Subject>(0);
     private Set<Subject> subjectsForCompulsorySubjectId = new HashSet<Subject>(0);
     private Set<Course> courses = new HashSet<Course>(0);

    public Subject() {
    }

	
    public Subject(SubjectCategory subjectCategory, String subjectCode, int numOfCredit, String type, boolean isActive, int numOfLesson) {
        this.subjectCategory = subjectCategory;
        this.subjectCode = subjectCode;
        this.numOfCredit = numOfCredit;
        this.type = type;
        this.isActive = isActive;
        this.numOfLesson = numOfLesson;
    }
    public Subject(SubjectCategory subjectCategory, String subjectNameE, String subjectNameV, String subjectCode, int numOfCredit, String type, String note, boolean isActive, int numOfLesson, Set<Subject> subjectsForSubjectId, Set<Subject> subjectsForCompulsorySubjectId, Set<Course> courses) {
       this.subjectCategory = subjectCategory;
       this.subjectNameE = subjectNameE;
       this.subjectNameV = subjectNameV;
       this.subjectCode = subjectCode;
       this.numOfCredit = numOfCredit;
       this.type = type;
       this.note = note;
       this.isActive = isActive;
       this.numOfLesson = numOfLesson;
       this.subjectsForSubjectId = subjectsForSubjectId;
       this.subjectsForCompulsorySubjectId = subjectsForCompulsorySubjectId;
       this.courses = courses;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="SubjectID", unique=true, nullable=false)
    public Integer getSubjectId() {
        return this.subjectId;
    }
    
    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="CategoryID", nullable=false)
    public SubjectCategory getSubjectCategory() {
        return this.subjectCategory;
    }
    
    public void setSubjectCategory(SubjectCategory subjectCategory) {
        this.subjectCategory = subjectCategory;
    }

    
    @Column(name="SubjectNameE", length=45)
    public String getSubjectNameE() {
        return this.subjectNameE;
    }
    
    public void setSubjectNameE(String subjectNameE) {
        this.subjectNameE = subjectNameE;
    }

    
    @Column(name="SubjectNameV", length=45)
    public String getSubjectNameV() {
        return this.subjectNameV;
    }
    
    public void setSubjectNameV(String subjectNameV) {
        this.subjectNameV = subjectNameV;
    }

    
    @Column(name="SubjectCode", nullable=false, length=10)
    public String getSubjectCode() {
        return this.subjectCode;
    }
    
    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    
    @Column(name="NumOfCredit", nullable=false)
    public int getNumOfCredit() {
        return this.numOfCredit;
    }
    
    public void setNumOfCredit(int numOfCredit) {
        this.numOfCredit = numOfCredit;
    }

    
    @Column(name="Type", nullable=false, length=20)
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
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

    
    @Column(name="NumOfLesson", nullable=false)
    public int getNumOfLesson() {
        return this.numOfLesson;
    }
    
    public void setNumOfLesson(int numOfLesson) {
        this.numOfLesson = numOfLesson;
    }

@ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="compulsory_subject", catalog="sfm", joinColumns = { 
        @JoinColumn(name="compulsorySubjectID", nullable=false, updatable=false) }, inverseJoinColumns = { 
        @JoinColumn(name="subjectID", nullable=false, updatable=false) })
    public Set<Subject> getSubjectsForSubjectId() {
        return this.subjectsForSubjectId;
    }
    
    public void setSubjectsForSubjectId(Set<Subject> subjectsForSubjectId) {
        this.subjectsForSubjectId = subjectsForSubjectId;
    }

@ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="compulsory_subject", catalog="sfm", joinColumns = { 
        @JoinColumn(name="subjectID", nullable=false, updatable=false) }, inverseJoinColumns = { 
        @JoinColumn(name="compulsorySubjectID", nullable=false, updatable=false) })
    public Set<Subject> getSubjectsForCompulsorySubjectId() {
        return this.subjectsForCompulsorySubjectId;
    }
    
    public void setSubjectsForCompulsorySubjectId(Set<Subject> subjectsForCompulsorySubjectId) {
        this.subjectsForCompulsorySubjectId = subjectsForCompulsorySubjectId;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="subject")
    public Set<Course> getCourses() {
        return this.courses;
    }
    
    public void setCourses(Set<Course> courses) {
        this.courses = courses;
    }




}


