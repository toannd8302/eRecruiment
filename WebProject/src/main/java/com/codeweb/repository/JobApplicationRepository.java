/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository;

import com.codeweb.pojos.jobApplication;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface JobApplicationRepository {
    boolean add(jobApplication jobApplication);
    boolean update(jobApplication jobApplication);
    List<jobApplication>jobApplicationList();
    List<jobApplication> getJobApplicationByStatus(String status);
    List<jobApplication> getJobApplicationByID(String id);
}
