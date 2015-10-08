package com.project.fpt.sfm.entities;
// Generated Oct 8, 2015 2:49:22 PM by Hibernate Tools 4.3.1


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
     private String abbreviation;
     private Integer numOfCredit;
     private String note;
     private Boolean isActive;
     private Set<Subject> subjectsForSubjectId = new HashSet<Subject>(0);
     private Set<Subject> subjectsForCompulsorySubjectId = new HashSet<Subject>(0);
     private Set<Course> courses = new HashSet<Course>(0);
     private Set<SubjectInLevel> subjectInLevels = new HashSet<SubjectInLevel>(0);

    public Subject() {
    }

	
    public Subject(SubjectCategory subjectCategory) {
        this.subjectCategory = subjectCategory;
    }
    public Subject(SubjectCategory subjectCategory, String subjectNameE, String subjectNameV, String subjectCode, String abbreviation, Integer numOfCredit, String note, Boolean isActive, Set<Subject> subjectsForSubjectId, Set<Subject> subjectsForCompulsorySubjectId, Set<Course> courses, Set<SubjectInLevel> subjectInLevels) {
       this.subjectCategory = subjectCategory;
       this.subjectNameE = subjectNameE;
       this.subjectNameV = subjectNameV;
       this.subjectCode = subjectCode;
       this.abbreviation = abbreviation;
       this.numOfCredit = numOfCredit;
       this.note = note;
       this.isActive = isActive;
       this.subjectsForSubjectId = subjectsForSubjectId;
       this.subjectsForCompulsorySubjectId = subjectsForCompulsorySubjectId;
       this.courses = courses;
       this.subjectInLevels = subjectInLevels;
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

    
    @Column(name="SubjectNameE", length=80)
    public String getSubjectNameE() {
        return this.subjectNameE;
    }
    
    public void setSubjectNameE(String subjectNameE) {
        this.subjectNameE = subjectNameE;
    }

    
    @Column(name="SubjectNameV", length=80)
    public String getSubjectNameV() {
        return this.subjectNameV;
    }
    
    public void setSubjectNameV(String subjectNameV) {
        this.subjectNameV = subjectNameV;
    }

    
    @Column(name="SubjectCode", length=15)
    public String getSubjectCode() {
        return this.subjectCode;
    }
    
    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    
    @Column(name="Abbreviation", length=15)
    public String getAbbreviation() {
        return this.abbreviation;
    }
    
    public void setAbbreviation(String abbreviation) {
        this.abbreviation = abbreviation;
    }

    
    @Column(name="NumOfCredit")
    public Integer getNumOfCredit() {
        return this.numOfCredit;
    }
    
    public void setNumOfCredit(Integer numOfCredit) {
        this.numOfCredit = numOfCredit;
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

@OneToMany(fetch=FetchType.LAZY, mappedBy="subject")
    public Set<SubjectInLevel> getSubjectInLevels() {
        return this.subjectInLevels;
    }
    
    public void setSubjectInLevels(Set<SubjectInLevel> subjectInLevels) {
        this.subjectInLevels = subjectInLevels;
    }




}


