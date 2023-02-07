/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.Jobposting;
import com.codeweb.repository.JobPostingRepository;
import com.codeweb.service.JobpostingService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author toan0
 */
@Service
public class JobpostingServiceImp implements JobpostingService {

    @Autowired
    private JobPostingRepository jobPostingRepository; 
    @Override
    public List<Jobposting> getJobposting() {
        return this.jobPostingRepository.getJobpostings();
    }

}
