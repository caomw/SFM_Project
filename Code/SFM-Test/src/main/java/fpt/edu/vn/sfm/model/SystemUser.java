package fpt.edu.vn.sfm.model;
// Generated Sep 14, 2015 8:03:49 AM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Systemuser generated by hbm2java
 */
@Entity
@Table(name = "systemuser"
        , catalog = "smf_test"
        , uniqueConstraints = @UniqueConstraint(columnNames = "Username")
)
public class SystemUser implements java.io.Serializable {


    private Integer userId;
    private Role role;
    private String username;
    private String password;
    private String email;
    private boolean isActive;

    public SystemUser() {
    }

    public SystemUser(Role role, String username, String password, String email, boolean isActive) {
        this.role = role;
        this.username = username;
        this.password = password;
        this.email = email;
        this.isActive = isActive;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)


    @Column(name = "UserID", unique = true, nullable = false)
    public Integer getUserId() {
        return this.userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "RoleID", nullable = false)
    public Role getRole() {
        return this.role;
    }

    public void setRole(Role role) {
        this.role = role;
    }


    @Column(name = "Username", unique = true, nullable = false, length = 45)
    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    @Column(name = "Password", nullable = false, length = 45)
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    @Column(name = "Email", nullable = false, length = 45)
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    @Column(name = "IsActive", nullable = false)
    public boolean isIsActive() {
        return this.isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }


}


