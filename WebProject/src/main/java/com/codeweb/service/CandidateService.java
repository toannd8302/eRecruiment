/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service;

import com.codeweb.loginModel.CustomOAuth2User;
import com.codeweb.pojos.candidate;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface CandidateService {
    List<candidate> getAll();
    boolean addOrUpdate(candidate candidate);
    candidate findCandidateByID(String id);
    candidate findCandidateByEmail(String email);

    public candidate processOAuthPostLogin(CustomOAuth2User oauthUser);
}
