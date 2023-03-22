/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service;

import com.codeweb.common.CustomOAuth2User;
import com.codeweb.pojos.candidate;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface CandidateService {
    boolean addOrUpdate(candidate candidate);
    boolean update(candidate candidate);
    List<candidate> getAll();
    candidate findCandidateByID(String id);
    candidate findCandidateByEmail(String email);
    candidate processOAuthPostLogin(CustomOAuth2User oauthUser);
}
