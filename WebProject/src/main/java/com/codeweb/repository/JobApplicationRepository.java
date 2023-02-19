/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository;

import com.codeweb.pojos.jobApplication;

/**
 *
 * @author KHOA
 */
public interface JobApplicationRepository {
    boolean addOrUpdate(jobApplication jobApplication);
}
