/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.pojos;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @author KHOA
 */
@Entity
@Table(name = "Reports")
public class report implements Serializable{
    
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "Report_id", columnDefinition = "NVARCHAR(6)")
    private String reportId;
    
    @Column(name = "Created_time")
    @Temporal(TemporalType.DATE)
    private Date createdTime;
    
    @Column(name = "Content")
    private String content;
    
    @Column(name = "Point")
    private float point;
    
    @ManyToOne
    @JoinColumn(name = "Employee_id")
    private employee employee;
    
    @ManyToOne
    @JoinColumn(name = "Application_id")
    private jobApplication jobApplication;
    
    @ManyToOne
    @JoinColumn(name = "Schedule_id")
    private schedule schedule;

    public String getReportId() {
        return reportId;
    }

    public void setReportId(String reportId) {
        this.reportId = reportId;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public float getPoint() {
        return point;
    }

    public void setPoint(float point) {
        this.point = point;
    }

    public employee getEmployee() {
        return employee;
    }

    public void setEmployee(employee employee) {
        this.employee = employee;
    }

    public jobApplication getJobApplication() {
        return jobApplication;
    }

    public void setJobApplication(jobApplication jobApplication) {
        this.jobApplication = jobApplication;
    }

    public schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(schedule schedule) {
        this.schedule = schedule;
    }
    
    
}
