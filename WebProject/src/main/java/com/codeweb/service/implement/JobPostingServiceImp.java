/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.jobPosition;
import com.codeweb.pojos.jobPosting;
import com.codeweb.repository.JobPositionRepository;
import com.codeweb.repository.JobPostingRepository;
import com.codeweb.service.JobPositionService;
import com.codeweb.service.JobPostingService;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
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
    @Autowired
    private JobPositionService jobPositionService;

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

    
    //Tạo 1 jobPosting
    @Override
    public boolean create(jobPosting jobPosting) {
        boolean resul = false;
        try {

            jobPosting.setApprovedStatus("Pending");
            
            jobPosting.setDescriptions(jobPosting.getDescriptions());
         
            jobPosting.setExprienceRequirement(jobPosting.getExprienceRequirement());
          
            jobPosting.setLocations(jobPosting.getLocations());
           
            jobPosting.setSalary(jobPosting.getSalary());

            jobPosting.setTypeOfWork(jobPosting.isTypeOfWork());

            jobPosting.setWelfare(jobPosting.getWelfare());

            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            jobPosting.setPostingTime(date);

            Date expiredTime = jobPosting.getExpiredTime();
            java.sql.Date sqlExpiredTime = new java.sql.Date(expiredTime.getTime());
            jobPosting.setExpiredTime(sqlExpiredTime);

            jobPosting.setLevel(jobPosting.getLevel());

            resul = this.jobPostingRepository.create(jobPosting);

        } catch (Exception e) {
            System.err.println("==CREATE JOB POSTING==" + e.getMessage());
        }
        return resul;
    }
}
