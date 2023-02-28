/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.codeweb.pojos.jobPosting;
import com.codeweb.repository.JobPostingRepository;
import com.codeweb.service.JobPostingService;
import java.util.Date;
import java.util.List;
import java.util.Map;
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

//    @Autowired
//    private Cloudinary cloudinary;

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
    public List<jobPosting> getAllJobPosting() {
        return this.jobPostingRepository.getAllJobPosting();
    }

    @Override
    public boolean addOrUpdate(jobPosting jobPosting) {
        try {
//            Map r = this.cloudinary.uploader().upload(jobPosting.getPicture().getBytes(),
//                    ObjectUtils.asMap("resource_type", "auto"));
    
            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            jobPosting.setExpiredTime(date);
            jobPosting.setApprovedStatus("Pending");
            jobPosting.setSalary(0);
            jobPosting.setDescriptions(null);
            jobPosting.setWelfare(null);
            jobPosting.setJobPosition(jobPosition);
            jobPosting.setLevel(null);
            jobPosting.setLevel(null);
            
            return this.jobPostingRepository.addOrUpdate(jobPosting);
        } catch (Exception e) {
             System.err.println("==CREATE JOBPOSTING==" + e.getMessage());
        }
        return false;
    }

}
