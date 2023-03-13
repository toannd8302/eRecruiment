/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.interviewerReasons;
import com.codeweb.repository.InterviewReasonRepository;
import com.codeweb.service.InterviewReasonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KHOA
 */
@Service
public class InterviewReasonServiceImp implements InterviewReasonService{

    @Autowired
    private InterviewReasonRepository interviewReasonRepository;
            
    @Override
    public boolean add(interviewerReasons irs) {
        return this.interviewReasonRepository.add(irs);
    }

    @Override
    public boolean update(interviewerReasons irs) {
        return this.interviewReasonRepository.update(irs);
    }
    
}
