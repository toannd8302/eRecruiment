/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.codeweb.pojos.jobApplication;
import com.codeweb.repository.JobApplicationRepository;
import com.codeweb.service.JobApplicationService;
import com.codeweb.service.SendMailService;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KHOA
 */
//Business Logic Layer

/*
chịu trách nhiệm cho việc xử lý các nghiệp vụ của ứng dụng
 */
@Service
public class JobApplicationServiceImp implements JobApplicationService {
    @Autowired
    private Cloudinary cloudinary;
    
    @Autowired
    private SendMailService sendMailService;

    @Autowired
    private JobApplicationRepository jobApplicationRepository;

    @Override
    public boolean add(jobApplication jobApplication) {
        try {
            Map r = this.cloudinary.uploader().upload(jobApplication.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));

            jobApplication.setCv((String) r.get("secure_url"));

            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            jobApplication.setCreatedTime(date);
            jobApplication.setRoundNumber(null);
            jobApplication.setCvStatus("Pending");
            jobApplication.setApplicationStatus("Review");
            return this.jobApplicationRepository.add(jobApplication);
        } catch (IOException e) {
            System.err.println("==CREATE APPLICATION==" + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean update(jobApplication jobApplication) {
        return this.jobApplicationRepository.update(jobApplication);
    }

    @Override
    public boolean updateAfterReview(jobApplication jobApplication, boolean result) {
        String title;
        String content;
        try {
            if (result) {
                jobApplication.setCvStatus("Approved");
                jobApplication.setApplicationStatus("Scheduling");
                title = "Results of CV assessment for " + jobApplication.getJobPosting().getJobPosition().getJobName() + " application";
                content = "Congratulation, your CV passes.\nWe will send you schedule interview in next email.";
            } else {
                jobApplication.setCvStatus("Rejected");
                jobApplication.setApplicationStatus("Fail");
                title = "Results of CV assessment for " + jobApplication.getJobPosting().getJobPosition().getJobName() + " application";;
                content = "We are sorry to inform that your CV does not meet recruitment requirements.\nGood luck on next time!!";
            }
            if(this.jobApplicationRepository.update(jobApplication)){
                this.sendMailService.sendEmail(jobApplication.getCandidate().getEmail(), title, content);
                return true;
            }
        } catch (Exception e) {
            System.err.println("==UPDATE APPLICATION==" + e.getMessage());
        }
        return false;
    }

    @Override
    public List<jobApplication> jobApplicationList() {
        return this.jobApplicationRepository.jobApplicationList();
    }

    @Override
    public Map<String, List<jobApplication>> getApplicationByStatus() {
        Map<String, List<jobApplication>> twoDimCollection = new HashMap<>();
        twoDimCollection.put("Review", this.jobApplicationRepository.getJobApplicationByStatus("Review"));
        twoDimCollection.put("Scheduling", this.jobApplicationRepository.getJobApplicationByStatus("Scheduling"));
        twoDimCollection.put("Scheduled", this.jobApplicationRepository.getJobApplicationByStatus("Scheduled"));
        twoDimCollection.put("On Going", this.jobApplicationRepository.getJobApplicationByStatus("On Going"));
        twoDimCollection.put("Fail", this.jobApplicationRepository.getJobApplicationByStatus("Fail"));
        return twoDimCollection;
    }

    @Override
    public jobApplication getJobApplicationByID(String id) {
        List<jobApplication> list = this.jobApplicationRepository.getJobApplicationByID(id);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }
}
