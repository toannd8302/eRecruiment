/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.jobPosting;
import com.codeweb.pojos.round;
import com.codeweb.repository.JobPostingRepository;
import com.codeweb.service.JobPostingService;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KHOA
 */
@Service
public class JobPostingServiceImp implements JobPostingService {

    @Autowired
    private JobPostingRepository jobPostingRepository;

    @Override
    public List<jobPosting> getPostByKeyword(String kw) {
        return this.jobPostingRepository.getPostByKeyword(kw);
    }

    @Override
    public jobPosting getPostByID(String id) {
        List<jobPosting> list = this.getPost(id);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    public List<jobPosting> getPost(String id) {
        return this.jobPostingRepository.getPostById(id);
    }

    @Override
    public Map<String, List<jobPosting>> getPostByStatus() {
        Map<String, List<jobPosting>> twoDimCollection = new HashMap<>();
        twoDimCollection.put("Pending", this.jobPostingRepository.getPostByStatus("Pending"));
        twoDimCollection.put("Approved", this.jobPostingRepository.getPostByStatus("Approved"));
        twoDimCollection.put("Rejected", this.jobPostingRepository.getPostByStatus("Rejected"));
        return twoDimCollection;
    }

    @Override
    public boolean updateJobPosting(jobPosting jobPosting, String action) {
        try {
            if (action.equals("accept")) {
                long millis = System.currentTimeMillis();
                java.sql.Date date = new java.sql.Date(millis);
                jobPosting.setPostingTime(date);
                jobPosting.setApprovedStatus("Approved");
            } else if (action.equals("reject")) {
                jobPosting.setApprovedStatus("Rejected");
            } else if (action.equals("end")) {
                jobPosting.setApprovedStatus("End");
            } else {
                return false;
            }
            return this.jobPostingRepository.update(jobPosting);
        } catch (Exception e) {
            System.err.println("UPDATE JOB POSTING ERROR AT JobPostingServiceImp");
        }
        return false;
    }

    @Override
    public List<jobPosting> getAllJobPosting() {
        return this.jobPostingRepository.getAllJobPosting();
    }

    @Override
    public boolean createJobPosting(jobPosting jobPosting) {
        boolean result = false;
        try {
            jobPosting.setDescriptions(jobPosting.getDescriptions());

            jobPosting.setTypeOfWork(jobPosting.isTypeOfWork());

            jobPosting.setExprienceRequirement(jobPosting.getExprienceRequirement());

            jobPosting.setLocations(jobPosting.getLocations());

            jobPosting.setWelfare(jobPosting.getWelfare());

            jobPosting.setSalary(jobPosting.getSalary());
            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            jobPosting.setCreatedTime(date);
            jobPosting.setPostingTime(null);
//            Date expiredTime = jobPosting.getExpiredTime();
//            java.sql.Date sqlExpiredTime = new java.sql.Date(expiredTime.getTime());
            jobPosting.setExpiredTime(null);
            jobPosting.setApprovedStatus("Pending");
            jobPosting.setLevel(jobPosting.getLevel());
            jobPosting.setPicture(jobPosting.getPicture());
            result = this.jobPostingRepository.createJobPosting(jobPosting);

        } catch (Exception e) {
            System.err.println("==CREATE JOB POSTING==" + e.getMessage());
        }
        return result;
    }

    @Override
    public void deleteJobPosting(String id) {
        this.jobPostingRepository.deleteJobPosting(id);
    }

}
