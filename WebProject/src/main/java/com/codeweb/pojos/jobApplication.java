/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.pojos;


import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author toan0
 */


    @Entity
    @Table(name = "Job_Applications")
    public class jobApplication implements Serializable{

        @Id
        @Column(name = "Application_id")
        private String applicationId;

        @Column(name = "Created_time")
        @Temporal(TemporalType.DATE)
        private Date createdTime;

        @Column(name = "CV")
        private String cv;

        @Column(name = "CV_status")
        private boolean cvStatus;

        @Column(nullable = true,name = "Round_number")
        private Integer roundNumber;

        @Column(name = "Application_status")
        private String applicationStatus;

        @Column(name = "Introduction")
        private String introduction;

        @ManyToOne
        @JoinColumn(name = "Candidate_id")
        private candidate candidate;

        @ManyToOne
        @JoinColumn(name = "Post_id")
        private jobPosting jobPosting;

        @Transient
        private MultipartFile file;

        public String getApplicationId() {
            return applicationId;
        }

        public void setApplicationId(String applicationId) {
            this.applicationId = applicationId;
        }

        public Date getCreatedTime() {
            return createdTime;
        }

        public void setCreatedTime(Date createdTime) {
            this.createdTime = createdTime;
        }

        public String getCv() {
            return cv;
        }

        public void setCv(String cv) {
            this.cv = cv;
        }

        public boolean isCvStatus() {
            return cvStatus;
        }

        public void setCvStatus(boolean cvStatus) {
            this.cvStatus = cvStatus;
        }

        public int getRoundNumber() {
            return roundNumber;
        }

        public void setRoundNumber(int roundNumber) {
            this.roundNumber = roundNumber;
        }

        public String getApplicationStatus() {
            return applicationStatus;
        }

        public void setApplicationStatus(String applicationStatus) {
            this.applicationStatus = applicationStatus;
        }

        public String getIntroduction() {
            return introduction;
        }

        public void setIntroduction(String introduction) {
            this.introduction = introduction;
        }

        public candidate getCandidate() {
            return candidate;
        }

        public void setCandidate(candidate candidate) {
            this.candidate = candidate;
        }

        public jobPosting getJobPosting() {
            return jobPosting;
        }

        public void setJobPosting(jobPosting jobPosting) {
            this.jobPosting = jobPosting;
        }

        public MultipartFile getFile() {
            return file;
        }

        public void setFile(MultipartFile file) {
            this.file = file;
        }

    @Override
    public String toString() {
        return "jobApplication{" + "applicationId=" + applicationId + ", createdTime=" + createdTime + ", cv=" + cv + ", cvStatus=" + cvStatus + ", roundNumber=" + roundNumber + ", applicationStatus=" + applicationStatus + ", introduction=" + introduction + ", candidate=" + candidate + ", jobPosting=" + jobPosting + ", file=" + file + '}';
    }
        
    }


