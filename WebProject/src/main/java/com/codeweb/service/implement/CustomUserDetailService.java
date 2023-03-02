/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.loginModel.CustomUserDetails;
import com.codeweb.pojos.department;
import com.codeweb.service.DepartmentService;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 *
 * @author KHOA
 */
@Service
public class CustomUserDetailService implements UserDetailsService{

    @Autowired
    private DepartmentService departmentService;
    
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        List<department> departments = this.departmentService.getDepartments(email);
        if(departments.isEmpty()){
            return null;
        } 
        department department = departments.get(0);
        return new CustomUserDetails(department);
    }
    
}
