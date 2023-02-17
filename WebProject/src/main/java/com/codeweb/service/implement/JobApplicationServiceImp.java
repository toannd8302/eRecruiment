/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.jobApplication;
import com.codeweb.repository.JobApplicationRepository;
import com.codeweb.service.JobApplicationService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author toan0
 */
@Service

public class JobApplicationServiceImp implements JobApplicationService{
@Autowired
private JobApplicationRepository jobApplicationRepository;
    
    @Override
    public List<jobApplication> viewAllJobApplication() {
        return this.jobApplicationRepository.viewAllJobApplication();
    }

    @Override
    public List<jobApplication> findJobApplicationById(String id) {
       return this.jobApplicationRepository.findJobApplicationById(id);
    }

    @Override
    public int editJobApplication(String id) {
        return this.jobApplicationRepository.editJobApplication(id);
    }
    
}
