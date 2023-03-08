/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.pojos;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author KHOA
 */
@Entity
@Table(name = "Interviewer_Reasons")
public class interviewerReasons implements Serializable{
    @Id
    @Column(name = "Schedule_id")
    private String scheduleId ;
    
    @Id
    @Column(name = "Employee_id")
    private String employeeId ;
    
    @Column(name = "Reason_content")
    private String Reason_content;
    
    @Column(name = "File_path")
    private String filepath;
    
    @Column(name = "Status")
    private String status;
    
    @ManyToOne()
    @JoinColumn(name = "Schedule_id")
    private schedule employeeSchedule;
    
    @ManyToOne
    @JoinColumn(name = "Employee_id")
    private employee employee;
    
    @Transient
    private MultipartFile file;

    public schedule getEmployeeSchedule() {
        return employeeSchedule;
    }

    public void setEmployeeSchedule(schedule employeeSchedule) {
        this.employeeSchedule = employeeSchedule;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public schedule getSchedule() {
        return employeeSchedule;
    }

    public void setSchedule(schedule schedule) {
        this.employeeSchedule = schedule;
    }

    public employee getEmployee() {
        return employee;
    }

    public void setEmployee(employee employee) {
        this.employee = employee;
    }

    public String getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(String scheduleId) {
        this.scheduleId = scheduleId;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getReason_content() {
        return Reason_content;
    }

    public void setReason_content(String Reason_content) {
        this.Reason_content = Reason_content;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
    
    
}
