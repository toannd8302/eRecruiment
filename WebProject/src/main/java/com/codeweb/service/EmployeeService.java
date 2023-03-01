/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service;

import com.codeweb.googleModel.CustomOAuth2User;
import com.codeweb.pojos.employee;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface EmployeeService {
    List<employee> getAll();
    boolean addOrUpdate(employee employee);
    employee findEmployeeByID(String id);
    employee findEmployeeByEmail(String email);

    public employee processOAuthPostLogin(CustomOAuth2User oauthUser);
}
