/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.candidate;
import com.codeweb.repository.CandidateRepository;
import com.codeweb.service.CandidateService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KHOA
 */
@Service
public class CandidateServiceImp implements CandidateService {

    @Autowired
    private CandidateRepository candidateRepository;

    @Override
    public boolean addOrUpdate(candidate candidate) {
        return this.candidateRepository.addOrUpdate(candidate);
    }
    
    @Override
    public List<candidate> getAll() {
        return this.candidateRepository.getAll();
    }
    
    @Override
    public List<candidate> getCandidateById(String id) {
        return this.candidateRepository.getCandidateById(id);
    }
    
    @Override
    public List<candidate> findByEmail(String email) {
        return this.candidateRepository.findByEmail(email);
    }
    
    @Override
    public candidate findCandidate(String id) {
        List<candidate> candidates = this.getCandidateById(id);
        if(!candidates.isEmpty())
            return candidates.get(0);
        else
            return null;
    }
}
