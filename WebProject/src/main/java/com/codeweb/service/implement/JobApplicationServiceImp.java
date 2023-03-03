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
import java.io.IOException;
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
    
//    private final Cloudinary cloudinary;
//
//    @Autowired
//    public JobApplicationServiceImpl(Cloudinary cloudinary) {
//        this.cloudinary = cloudinary;
//    }
    
    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private JobApplicationRepository jobApplicationRepository;

    @Override
    public boolean addOrUpdate(jobApplication jobApplication) {
        try {
            Map r = this.cloudinary.uploader().upload(jobApplication.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));

            jobApplication.setCv((String) r.get("secure_url"));

            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            jobApplication.setCreatedTime(date);

            jobApplication.setCvStatus("Pending");

            jobApplication.setRoundNumber(null);

            jobApplication.setApplicationStatus(null);

            return this.jobApplicationRepository.addOrUpdate(jobApplication);
        } catch (IOException e) {
            System.err.println("==CREATE APPLICATION==" + e.getMessage());
        }
        return false;
    }

    @Override
    public List<jobApplication> jobApplicationList() {
           return this.jobApplicationRepository.jobApplicationList();
    }

}
