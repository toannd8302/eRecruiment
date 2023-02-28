/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.googleModel.CustomUserDetails;
import com.codeweb.pojos.candidate;
import com.codeweb.repository.CandidateRepository;
import com.codeweb.service.CandidateService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author KHOA
 */
@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    @Autowired
    private CandidateService candidateService;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        //Load User information from OAuth2 provider to OAuth2User
        OAuth2User oAuth2User = super.loadUser(userRequest);
        candidate candidate = new candidate();

        //List of Attributes
        Map<String, Object> attributes = oAuth2User.getAttributes();

        //List of authorities of user for our systems
        List<GrantedAuthority> authorities = new ArrayList<>();

        // Extract necessary details from the OAuth2User
        String id = oAuth2User.getAttribute("sub");
        String email = oAuth2User.getAttribute("email");
        String name = oAuth2User.getAttribute("name");
        String picture = oAuth2User.getAttribute("picture");
        String registrationId = userRequest.getClientRegistration().getRegistrationId();

        try {
            if (registrationId != null && registrationId.equals("google-employee")) {
                //Check if the employee already exists in database
            } else if (registrationId != null && registrationId.equals("google-candidate")) {
                //Check if the candidate already exists in database
                candidate = this.candidateService.findCandidate(id);
                if (candidate != null) {
                    // Candidate exists, so update their name if necessary
                    if (!candidate.getName().equals(name)) {
                        candidate.setName(name);
                        this.candidateService.addOrUpdate(candidate);
                    }
                } else {
                    // Candidate does not exist, so create a new user object and save it to the database
                    candidate.setId(id);
                    candidate.setEmail(email);
                    candidate.setName(name);
                    candidate.setPicture(picture);
                    candidate.setRole("ROLE_CANDIDATE"); // Set default role to candidate
                    this.candidateService.addOrUpdate(candidate);
                }
                authorities.add(new SimpleGrantedAuthority(candidate.getRole()));
            }
        } catch (Exception e) {
            System.err.println("Error at CustomOAuth2UserService in service: " + e.getMessage());
        }
        return new CustomUserDetails(candidate, attributes, authorities);
    }
}
