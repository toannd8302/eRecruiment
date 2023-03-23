/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service;

import com.codeweb.pojos.jobApplicationSchedule;

/**
 *
 * @author KHOA
 */
public interface JobApplicationScheduleService {
    jobApplicationSchedule getByIDs(String applicationId, String scheduleId);
    boolean scheduleDecision(String applicationId, String scheduleId, String action);
    boolean update(jobApplicationSchedule jobApplicationSchedule);
}
