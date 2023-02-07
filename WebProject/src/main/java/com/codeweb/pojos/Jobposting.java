/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.pojos;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author toan0
 */
@Entity
@Table(name = "Job_postings")
public class Jobposting implements Serializable { //Giup dong bo tren moi truong internet(Server)

    @Id
    @Column(name = "Post_id")
    private String Postid;
    
    private String Descriptions;
    
    @Column(name = "Type_of_work")
    private boolean TypeOfWork;
    
    
    @Column(name = "Experience_requirement")
    private int ExprienceRequirement;
    
    private String Locations;
    
    private String Welfare;
    
    private int Salary;
    
  
    @Column(name = "Posting_time")
    @Temporal(TemporalType.DATE)
    private Date PostingTime;

    @Column(name = "Expired_time")
    @Temporal(TemporalType.DATE)
    private Date ExpiredTime;
    
    @Column(name = "Approved_status")
    private boolean ApprovedStatus;
    
    @ManyToOne
    @JoinColumn(name = "Job_id")
    private JobPosition JobId;
    
    @OneToMany (mappedBy = "PostId")
    private Set<Round> rounds;

    public String getPostid() {
        return Postid;
    }

    public void setPostid(String Postid) {
        this.Postid = Postid;
    }

    public String getDescriptions() {
        return Descriptions;
    }

    public void setDescriptions(String Descriptions) {
        this.Descriptions = Descriptions;
    }

    public boolean isTypeOfWork() {
        return TypeOfWork;
    }

    public void setTypeOfWork(boolean TypeOfWork) {
        this.TypeOfWork = TypeOfWork;
    }

  

    public int getExprienceRequirement() {
        return ExprienceRequirement;
    }

    public void setExprienceRequirement(int ExprienceRequirement) {
        this.ExprienceRequirement = ExprienceRequirement;
    }

    public String getLocations() {
        return Locations;
    }

    public void setLocations(String Locations) {
        this.Locations = Locations;
    }

    public String getWelfare() {
        return Welfare;
    }

    public void setWelfare(String Welfare) {
        this.Welfare = Welfare;
    }

    public int getSalary() {
        return Salary;
    }

    public void setSalary(int Salary) {
        this.Salary = Salary;
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

    public boolean isApprovedStatus() {
        return ApprovedStatus;
    }

    public void setApprovedStatus(boolean ApprovedStatus) {
        this.ApprovedStatus = ApprovedStatus;
    }

    public JobPosition getJobId() {
        return JobId;
    }

    public void setJobId(JobPosition JobId) {
        this.JobId = JobId;
    }

    public Set<Round> getRounds() {
        return rounds;
    }

    public void setRounds(Set<Round> rounds) {
        this.rounds = rounds;
    }

    @Override
    public String toString() {
        return "Jobposting{" + "Postid=" + Postid + ", Descriptions=" + Descriptions + ", TypeOfWork=" + TypeOfWork + ", ExprienceRequirement=" + ExprienceRequirement + ", Locations=" + Locations + ", Welfare=" + Welfare + ", Salary=" + Salary + ", PostingTime=" + PostingTime + ", ExpiredTime=" + ExpiredTime + ", ApprovedStatus=" + ApprovedStatus + ", JobId=" + JobId  + '}';
    }
    
    
}
