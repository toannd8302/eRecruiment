/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.pojos;

import java.io.Serializable;
import java.util.Date;
import java.sql.Time;

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
import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @author toan0
 */
@Entity
@Table(name = "Schedules")
public class schedule implements Serializable{
    
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "Schedule_id", columnDefinition = "NVARCHAR(6)")
    private String scheduleId;   
    
    @Column(name = "Schedule_date")
     @Temporal(TemporalType.DATE)
    private Date scheduleDate;
    
    @Column(name = "Schedule_time")
    private Time scheduleTime;
    
    @Column(name = "Location")
    private String location;
    
    @Column(name = "Type_of_interview")
    private boolean typeOfInterview;
    
    @Column(name = "Status")
    private String status;
    
    @OneToMany(mappedBy = "applicationSchedule",fetch = FetchType.EAGER)
    private Set<jobApplicationSchedule>jAS;
    
    @OneToMany(mappedBy = "employeeSchedule",fetch = FetchType.EAGER)
    private Set<interviewerReasons>iRS;
    
    @OneToMany(mappedBy = "schedule",fetch = FetchType.EAGER)
    private Set<report> reports;

    @ManyToOne
    @JoinColumn(name = "Round_id")
    private round round;
    
    public round getRound() {
        return round;
    }

    public void setRound(round round) {
        this.round = round;
    }

    public String getScheduleId() {
        return scheduleId;
    }

    public Set<interviewerReasons> getiRS() {
        return iRS;
    }

    public void setiRS(Set<interviewerReasons> iRS) {
        this.iRS = iRS;
    }

    public Set<report> getReports() {
        return reports;
    }

    public void setReports(Set<report> reports) {
        this.reports = reports;
    }

    public void setScheduleId(String scheduleId) {
        this.scheduleId = scheduleId;
    }

    public Date getScheduleDate() {
        return scheduleDate;
    }

    public void setScheduleDate(Date scheduleDate) {
        this.scheduleDate = scheduleDate;
    }

    public Time getScheduleTime() {
        return scheduleTime;
    }

    public void setScheduleTime(Time scheduleTime) {
        this.scheduleTime = scheduleTime;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public boolean isTypeOfInterview() {
        return typeOfInterview;
    }

    public void setTypeOfInterview(boolean typeOfInterview) {
        this.typeOfInterview = typeOfInterview;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Set<jobApplicationSchedule> getjAS() {
        return jAS;
    }

    public void setjAS(Set<jobApplicationSchedule> jAS) {
        this.jAS = jAS;
    }

    @Override
    public String toString() {
        return "schedule{" + "scheduleId=" + scheduleId + ", scheduleDate=" + scheduleDate + ", scheduleTime=" + scheduleTime + ", location=" + location + ", typeOfInterview=" + typeOfInterview + ", status=" + status + ", jAS=" + jAS + '}';
    }
    
}
