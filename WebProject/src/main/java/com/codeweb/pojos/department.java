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
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author toan0
 */
@Entity
@Table(name = "Departments")
public class department implements Serializable{
    @Id
    @Column(name = "Department_id")
    private String departmentId;
    
    @Column(name = "DepartmentName")
    private String departmentName; 
    
    @Column(name = "Email")
    private String email;
    
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

