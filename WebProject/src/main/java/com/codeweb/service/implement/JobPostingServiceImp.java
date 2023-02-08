/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.jobPosting;
import com.codeweb.repository.JobPostingRepository;
import com.codeweb.service.JobPostingService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KHOA
 */
@Service
public class JobPostingServiceImp implements JobPostingService{
    @Autowired
    private JobPostingRepository jobPostingRepository;

    @Override
    public List<jobPosting> getAllPost() {
        return this.jobPostingRepository.getAllPost();
    }
    
}