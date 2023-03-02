/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.loginModel.CustomOAuth2User;
import com.codeweb.pojos.employee;
import com.codeweb.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

/**
 *
 * @author KHOA
 */
@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    @Autowired
    private EmployeeService employeeService;
            
    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User user =  super.loadUser(userRequest);
        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        String role = new String();
        if(user != null && registrationId.equals("google-candidate")){
            role = "ROLE_CANDIDATE";
        }
        if(user != null && registrationId.equals("google-employee")){
            String email = user.getAttribute("email");
            employee employee = this.employeeService.findEmployeeByEmail(email);
            if(employee != null)
                role = employee.getRole();
            else
                role = "NULL";
        }
        return new CustomOAuth2User(user,registrationId,role);
    }
}
