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
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @author toan0
 */
@Entity
@Table(name = "Job_postings")
public class jobPosting implements Serializable, Comparable<jobPosting> { //Giup dong bo tren moi truong internet(Server)

    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "Post_id", columnDefinition = "NVARCHAR(6)")
    private String postId;
    
    
    @Column(name = "Descriptions")
    private String descriptions;
    
    @Column(name = "Type_of_work")
    private boolean typeOfWork;
    
    @Column(nullable=true, name = "Experience_requirement")
    private Integer exprienceRequirement;
    
    @Column(name = "Locations")
    private String locations;
    
    @Column(name = "Welfare")
    private String welfare;
    
    @Column(nullable=true, name = "Salary")
    private Integer salary;
    
    @Column(name = "Posting_time")
    @Temporal(TemporalType.DATE)
    private Date PostingTime;

    @Column(name = "Expired_time")
    @Temporal(TemporalType.DATE)
    private Date ExpiredTime;
    
    @Column(name = "Approved_status")
    private String ApprovedStatus;
    
    @Column(name = "Level")
    private String level;
    
    @ManyToOne
    @JoinColumn(name = "Job_id")
    private jobPosition jobPosition;
    
    @OneToMany (mappedBy = "jobPoting", fetch = FetchType.EAGER)
    private Set<round> rounds;
    
    @OneToMany(mappedBy = "jobPosting")
    private Set<jobApplication> jobApplications;

    
    
    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
    
    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public boolean isTypeOfWork() {
        return typeOfWork;
    }

    public void setTypeOfWork(boolean typeOfWork) {
        this.typeOfWork = typeOfWork;
    }

    public int getExprienceRequirement() {
        if(exprienceRequirement == null)
            return 0;
        return exprienceRequirement;
    }

    public void setExprienceRequirement(int exprienceRequirement) {
        this.exprienceRequirement = exprienceRequirement;
    }

    public String getLocations() {
        return locations;
    }

    public void setLocations(String locations) {
        this.locations = locations;
    }

    public String getWelfare() {
        return welfare;
    }

    public void setWelfare(String welfare) {
        this.welfare = welfare;
    }

    public int getSalary() {
        if(salary == null)
            return 0;
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public Date getPostingTime() {
        return PostingTime;
    }

    public void setPostingTime(Date PostingTime) {
        this.PostingTime = PostingTime;
    }

    public Date getExpiredTime() {
        return ExpiredTime;
    }

    public void setExpiredTime(Date ExpiredTime) {
        this.ExpiredTime = ExpiredTime;
    }

    public String isApprovedStatus() {
        return ApprovedStatus;
    }

    public void setApprovedStatus(String ApprovedStatus) {
        this.ApprovedStatus = ApprovedStatus;
    }

    public jobPosition getJobPosition() {
        return jobPosition;
    }

    public void setJobPosition(jobPosition jobPosition) {
        this.jobPosition = jobPosition;
    }

    public Set<round> getRounds() {
        return rounds;
    }

    public void setRounds(Set<round> rounds) {
        this.rounds = rounds;
    }

    public Set<jobApplication> getJobApplications() {
        return jobApplications;
    }

    public void setJobApplications(Set<jobApplication> jobApplications) {
        this.jobApplications = jobApplications;
    }

    @Override
    public String toString() {
        return "jobPosting{" + "postId=" + postId + ", descriptions=" + descriptions + ", typeOfWork=" + typeOfWork + ", exprienceRequirement=" + exprienceRequirement + ", locations=" + locations + ", welfare=" + welfare + ", salary=" + salary + ", PostingTime=" + PostingTime + ", ExpiredTime=" + ExpiredTime + ", ApprovedStatus=" + ApprovedStatus + '}';
    }

    @Override
    public int compareTo(jobPosting o) {
        return this.getPostId().compareTo(o.getPostId());
    }

    
}
