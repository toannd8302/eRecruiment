/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service;

import com.codeweb.pojos.employee;
import com.codeweb.pojos.jobApplication;
import java.util.List;
import java.util.Map;

/**
 *
 * @author KHOA
 */
public interface JobApplicationService {
    boolean add(jobApplication jobApplication);
    boolean update(jobApplication jobApplication);
    boolean updateAfterReview(jobApplication jobApplication, boolean result);
    List<jobApplication>jobApplicationList();
    Map<String,List<jobApplication>> getApplicationByStatus();
    jobApplication getJobApplicationByID(String id);
}
