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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * User generated by hbm2java
 */
@Entity
@Table(name="_user"
    ,catalog="sfm"
    , uniqueConstraints = @UniqueConstraint(columnNames="Username") 
)
public class User  implements java.io.Serializable {


     private Integer userId;
     private String username;
     private String password;
     private String note;
     private Boolean isActive;
     private Set<Role> roles = new HashSet<Role>(0);
     private Student student;
     private Manager manager;
     private Staff staff;

    public User() {
    }

	
    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }
    public User(String username, String password, String note, Boolean isActive, Set<Role> roles, Student student, Manager manager, Staff staff) {
       this.username = username;
       this.password = password;
       this.note = note;
       this.isActive = isActive;
       this.roles = roles;
       this.student = student;
       this.manager = manager;
       this.staff = staff;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="UserID", unique=true, nullable=false)
    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    
    @Column(name="Username", unique=true, nullable=false, length=64)
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    
    @Column(name="Password", nullable=false, length=64)
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
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
    @JoinTable(name="user_role", catalog="sfm", joinColumns = { 
        @JoinColumn(name="UserID", nullable=false, updatable=false) }, inverseJoinColumns = { 
        @JoinColumn(name="RoleID", nullable=false, updatable=false) })
    public Set<Role> getRoles() {
        return this.roles;
    }
    
    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

@OneToOne(fetch=FetchType.LAZY, mappedBy="user")
    public Student getStudent() {
        return this.student;
    }
    
    public void setStudent(Student student) {
        this.student = student;
    }

@OneToOne(fetch=FetchType.LAZY, mappedBy="user")
    public Manager getManager() {
        return this.manager;
    }
    
    public void setManager(Manager manager) {
        this.manager = manager;
    }

@OneToOne(fetch=FetchType.LAZY, mappedBy="user")
    public Staff getStaff() {
        return this.staff;
    }
    
    public void setStaff(Staff staff) {
        this.staff = staff;
    }




}


