/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.loginModel.CustomOAuth2User;
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
    public candidate findCandidateByID(String id) {
        List<candidate> candidates = this.candidateRepository.getCandidateById(id);
        if(!candidates.isEmpty())
            return candidates.get(0);
        else
            return null;
    }
    
    @Override
    public candidate findCandidateByEmail(String email) {
        List<candidate> candidates = this.candidateRepository.getCandidateByEmail(email);
        if(!candidates.isEmpty())
            return candidates.get(0);
        else
            return null;
    }

    @Override
    public candidate processOAuthPostLogin(CustomOAuth2User oauthUser) {
        String email = oauthUser.getEmail();
        candidate existUser = this.findCandidateByEmail(email);
        if(existUser == null){
            candidate newUser = new candidate();
            newUser.setId(oauthUser.getID());
            newUser.setEmail(oauthUser.getEmail());
            newUser.setName(oauthUser.getName());
            newUser.setGiven_name(oauthUser.getGivenName());
            newUser.setFamily_name(oauthUser.getLastName());
            newUser.setPicture(oauthUser.getPicture());
            newUser.setRole("ROLE_CANDIDATE");
            this.candidateRepository.addOrUpdate(newUser);
            return newUser;
        }else{
            if(!existUser.getName().equals(oauthUser.getName()) || !existUser.getPicture().equals(oauthUser.getPicture())){
                existUser.setName(oauthUser.getName());
                existUser.setFamily_name(oauthUser.getLastName());
                existUser.setGiven_name(oauthUser.getGivenName());
                existUser.setPicture(oauthUser.getPicture());
                this.candidateRepository.addOrUpdate(existUser);
            }
            return existUser;
        }
    }
}
