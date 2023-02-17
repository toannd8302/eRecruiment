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
    public List<jobPosting> getPostByKeyword(String kw) {
        return this.jobPostingRepository.getPostByKeyword(kw);
    }

    @Override
    public jobPosting getPostByID(String id) {
        List<jobPosting> list = this.getPost(id);
        if(list.isEmpty()){
            return null;
        }
        return list.get(0);
    }

    @Override
    public List<jobPosting> getPost(String id) {
        return this.jobPostingRepository.getPostById(id);
    }
    
}
