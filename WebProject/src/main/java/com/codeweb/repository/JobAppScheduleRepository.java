/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository;

import com.codeweb.pojos.jobApplicationSchedule;
import com.codeweb.pojos.schedule;

/**
 *
 * @author KHOA
 */
public interface JobAppScheduleRepository {
    boolean add(jobApplicationSchedule jobApplicationSchedule);
}
