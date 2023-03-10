/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository;

import com.codeweb.pojos.candidate;
import com.codeweb.pojos.employee;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface EmployeeRepository {
    boolean addOrUpdate(employee employee);
    List<employee> getAll();
    
    List<employee> getEmployeeByEmail(String email);
    
    List<employee> getEmployeeById(String id);
}
