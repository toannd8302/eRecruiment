/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.department;
import com.codeweb.repository.DepartmentRepository;
import com.codeweb.service.DepartmentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KHOA
 */
@Service()
public class DepartmentServiceImp implements DepartmentService{
    
    @Autowired
    private DepartmentRepository departmentRepository;
    
    @Override
    public boolean addDepartment(department department) {
        return this.departmentRepository.addDepartment(department);
    }

    @Override
    public List<department> getDepartments(String email) {
        return this.departmentRepository.getDepartments(email);
    }

    @Override
    public department getDepartment(String email) {
        List<department> departments = this.getDepartments(email);
        if(departments.isEmpty())
            return null;
        return departments.get(0);
    }
}
