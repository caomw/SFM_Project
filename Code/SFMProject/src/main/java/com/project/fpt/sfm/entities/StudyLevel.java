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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * StudyLevel generated by hbm2java
 */
@Entity
@Table(name="study_level"
    ,catalog="sfm"
)
public class StudyLevel  implements java.io.Serializable {


     private Integer studyLevelId;
     private String levelCode;
     private String levelName;
     private int tuitionVnd;
     private int tuitionUsd;
     private String note;
     private boolean isActive;
     private Set<SubjectInLevel> subjectInLevels = new HashSet<SubjectInLevel>(0);
     private Set<Semester> semesters = new HashSet<Semester>(0);

    public StudyLevel() {
    }

	
    public StudyLevel(String levelCode, String levelName, int tuitionVnd, int tuitionUsd, boolean isActive) {
        this.levelCode = levelCode;
        this.levelName = levelName;
        this.tuitionVnd = tuitionVnd;
        this.tuitionUsd = tuitionUsd;
        this.isActive = isActive;
    }
    public StudyLevel(String levelCode, String levelName, int tuitionVnd, int tuitionUsd, String note, boolean isActive, Set<SubjectInLevel> subjectInLevels, Set<Semester> semesters) {
       this.levelCode = levelCode;
       this.levelName = levelName;
       this.tuitionVnd = tuitionVnd;
       this.tuitionUsd = tuitionUsd;
       this.note = note;
       this.isActive = isActive;
       this.subjectInLevels = subjectInLevels;
       this.semesters = semesters;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="StudyLevelID", unique=true, nullable=false)
    public Integer getStudyLevelId() {
        return this.studyLevelId;
    }
    
    public void setStudyLevelId(Integer studyLevelId) {
        this.studyLevelId = studyLevelId;
    }

    
    @Column(name="LevelCode", nullable=false, length=15)
    public String getLevelCode() {
        return this.levelCode;
    }
    
    public void setLevelCode(String levelCode) {
        this.levelCode = levelCode;
    }

    
    @Column(name="LevelName", nullable=false, length=45)
    public String getLevelName() {
        return this.levelName;
    }
    
    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }

    
    @Column(name="TuitionVND", nullable=false)
    public int getTuitionVnd() {
        return this.tuitionVnd;
    }
    
    public void setTuitionVnd(int tuitionVnd) {
        this.tuitionVnd = tuitionVnd;
    }

    
    @Column(name="TuitionUSD", nullable=false)
    public int getTuitionUsd() {
        return this.tuitionUsd;
    }
    
    public void setTuitionUsd(int tuitionUsd) {
        this.tuitionUsd = tuitionUsd;
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

@OneToMany(fetch=FetchType.LAZY, mappedBy="studyLevel")
    public Set<SubjectInLevel> getSubjectInLevels() {
        return this.subjectInLevels;
    }
    
    public void setSubjectInLevels(Set<SubjectInLevel> subjectInLevels) {
        this.subjectInLevels = subjectInLevels;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="studyLevel")
    public Set<Semester> getSemesters() {
        return this.semesters;
    }
    
    public void setSemesters(Set<Semester> semesters) {
        this.semesters = semesters;
    }




}

