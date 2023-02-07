/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.pojos;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author toan0
 */
@Entity
 @Table(name = "Job_positions")
public class JobPosition {
    @Id
    @Column(name = "Job_id")
    private String JobId;
    private String JobName;
    private String Skill;
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "JobId")
    private Set<Jobposting>JobPosting;
            
    @ManyToOne
    @JoinColumn(name = "Department_id")
    private Department DepartmentId;
    
    @ManyToMany(mappedBy = "JobPositions")
    private Set<Skill>skills;

    public String getJobId() {
        return JobId;
    }

    public void setJobId(String JobId) {
        this.JobId = JobId;
    }

    public String getJobName() {
        return JobName;
    }

    public void setJobName(String JobName) {
        this.JobName = JobName;
    }

    public String getSkill() {
        return Skill;
    }

    public void setSkill(String Skill) {
        this.Skill = Skill;
    }

    public Set<Jobposting> getJobPosting() {
        return JobPosting;
    }

    public void setJobPosting(Set<Jobposting> JobPosting) {
        this.JobPosting = JobPosting;
    }

    public Department getDepartmentId() {
        return DepartmentId;
    }

    public void setDepartmentId(Department DepartmentId) {
        this.DepartmentId = DepartmentId;
    }

    public Set<Skill> getSkills() {
        return skills;
    }

    public void setSkills(Set<Skill> skills) {
        this.skills = skills;
    }
    
}
