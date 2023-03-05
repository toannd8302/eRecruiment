/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.pojos;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author toan0
 */
@Entity
@Table(name = "Job_application_Schedule")
public class jobApplicationSchedule implements Serializable{
    
    @Id
    @Column(name = "Application_id")
    private String applicationId ;
    
    @Id
    @Column(name = "Schedule_id")
    private String scheduleId ;
    
    @Column(name = "Reason_content")
    private String Reason_content;
    
    @Column(name = "File_path")
    private String filepath;
    
    @Column(name = "Status")
    private String status;
    
    @ManyToOne
    @JoinColumn(name = "Application_id")
    private jobApplication jobApplication;
    
    @ManyToOne()
    @JoinColumn(name = "Schedule_id")
    private schedule applicationSchedule;

    public schedule getApplicationSchedule() {
        return applicationSchedule;
    }

    public void setApplicationSchedule(schedule applicationSchedule) {
        this.applicationSchedule = applicationSchedule;
    }
    
    @Transient
    private MultipartFile file;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(String applicationId) {
        this.applicationId = applicationId;
    }

    public String getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(String scheduleId) {
        this.scheduleId = scheduleId;
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

    public jobApplication getJobApplication() {
        return jobApplication;
    }

    public void setJobApplication(jobApplication jobApplication) {
        this.jobApplication = jobApplication;
    }

    public schedule getSchedule() {
        return applicationSchedule;
    }

    public void setSchedule(schedule schedule) {
        this.applicationSchedule = schedule;
    }
    
}
