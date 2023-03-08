/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.jobPosition;
import com.codeweb.repository.JobPositionRepository;
import com.codeweb.service.JobPositionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author toan0
 */
@Service
public class JobPositionServiceImp implements JobPositionService{
    
    @Autowired 
    private JobPositionRepository jobPositionRepository;

    @Override
    public List<jobPosition> getAll() {
        
        return this.jobPositionRepository.getAll();
    }

    @Override
    public jobPosition getbyId(String id) {
        return this.jobPositionRepository.getbyId(id);
    }
    
    
    
}
