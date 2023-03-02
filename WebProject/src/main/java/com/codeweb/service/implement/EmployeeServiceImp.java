/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.loginModel.CustomOAuth2User;
import com.codeweb.pojos.employee;
import com.codeweb.repository.EmployeeRepository;
import com.codeweb.service.EmployeeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KHOA
 */
@Service
public class EmployeeServiceImp implements EmployeeService{
    
    @Autowired
    private EmployeeRepository employeeRepository;

    @Override
    public List<employee> getAll() {
        return this.employeeRepository.getAll();
    }

    @Override
    public boolean addOrUpdate(employee employee) {
        return this.employeeRepository.addOrUpdate(employee);
    }

    @Override
    public employee findEmployeeByID(String id) {
        List<employee> employees = this.employeeRepository.getEmployeeById(id);
        if(!employees.isEmpty())
            return employees.get(0);
        else
            return null;
    }

    @Override
    public employee findEmployeeByEmail(String email) {
        List<employee> employees = this.employeeRepository.getEmployeeByEmail(email);
        if(!employees.isEmpty())
            return employees.get(0);
        else
            return null;
    }

    @Override
    public employee processOAuthPostLogin(CustomOAuth2User oauthUser) {
        String email = oauthUser.getEmail();
        employee existUser = this.findEmployeeByEmail(email);
        if(existUser != null){
            return existUser;
        }
        return null;
    }
    
}
