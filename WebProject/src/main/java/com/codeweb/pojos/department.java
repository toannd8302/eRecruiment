/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.pojos;

/**
 *
 * @author KHOA
 */
import java.io.Serializable;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @author toan0
 */
@Entity
@Table(name = "Departments")
public class department implements Serializable{
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "Department_id", columnDefinition = "NVARCHAR(6)")
    private String departmentId;
    
    @Column(name = "DepartmentName")
    private String departmentName; 
    
    @Column(name = "Email")
    private String email;
    
    @Column(name = "Password")
    private String password;
    
    @Column(name = "Role")
    private String role;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    @OneToMany(mappedBy = "department")
    private Set<jobPosition>jobPositions;

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Set<jobPosition> getJobPositions() {
        return jobPositions;
    }

    public void setJobPositions(Set<jobPosition> jobPositions) {
        this.jobPositions = jobPositions;
    }

    @Override
    public String toString() {
        return "department{" + "departmentId=" + departmentId + ", departmentName=" + departmentName + ", email=" + email + '}';
    }
    
    
}

