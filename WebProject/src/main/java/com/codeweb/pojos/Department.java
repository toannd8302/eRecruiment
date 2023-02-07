/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.pojos;

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
public class Department implements Serializable{
    @Id
    @Column(name = "Department_id")
    private String DepartmentId;
    
    private String DepartmentName; 
    
    private String Email;
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "DepartmentId")
    private Set<JobPosition>JobPositions;
}
