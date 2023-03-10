/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository;

import com.codeweb.pojos.department;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface DepartmentRepository {
    boolean addDepartment(department department);
    List<department> getDepartments(String email);
}
