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
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @author toan0
 */
@Entity
@Table(name = "Job_positions")
public class jobPosition {
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "Job_id", columnDefinition = "NVARCHAR(6)")
    private String jobId;
    
    @Column(name = "JobName")
    private String jobName;
    
    @OneToMany(mappedBy = "jobPosition")
    private Set<jobPosting>jobPostings;
            
    @ManyToOne
    @JoinColumn(name = "Department_id")
    private department department;
    
    @ManyToMany(mappedBy = "jobPositions", fetch = FetchType.EAGER)
    private Set<skill>skills;
    
    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public Set<jobPosting> getJobPostings() {
        return jobPostings;
    }

    public void setJobPostings(Set<jobPosting> jobPostings) {
        this.jobPostings = jobPostings;
    }

    public department getDepartment() {
        return department;
    }

    public void setDepartment(department department) {
        this.department = department;
    }

    public Set<skill> getSkills() {
        return skills;
    }

    public void setSkills(Set<skill> skills) {
        this.skills = skills;
    }
    
    @Override
    public String toString() {
        return "jobPosition{" + "jobId=" + jobId + ", jobName=" + jobName + '}';
    }
    
    
}
