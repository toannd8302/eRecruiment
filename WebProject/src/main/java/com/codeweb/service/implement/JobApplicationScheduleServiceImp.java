/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.jobApplicationSchedule;
import com.codeweb.repository.JobAppScheduleRepository;
import com.codeweb.repository.JobPositionRepository;
import com.codeweb.service.JobApplicationScheduleService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KHOA
 */
@Service
public class JobApplicationScheduleServiceImp implements JobApplicationScheduleService {

    @Autowired
    private JobAppScheduleRepository jobAppScheduleRepository;

    @Override
    public jobApplicationSchedule getByIDs(String applicationId, String scheduleId) {
        List<jobApplicationSchedule> list = this.jobAppScheduleRepository.getJobAppScheduleByID(applicationId, scheduleId);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    public boolean scheduleDecision(String applicationId, String scheduleId, String action) {
        if (applicationId != null && scheduleId != null && action != null) {
            jobApplicationSchedule jobAppSchedule = this.getByIDs(applicationId, scheduleId);
            if (jobAppSchedule != null) {
                if (action.equals("accept")) {
                    jobAppSchedule.setStatus("Approved");
                } else if (action.equals("reject")) {
                    jobAppSchedule.setStatus("Rejected");
                } else {
                    return false;
                }
                return this.update(jobAppSchedule);
            }
        }
        return false;
    }

    @Override
    public boolean update(jobApplicationSchedule jobApplicationSchedule) {
        return this.jobAppScheduleRepository.update(jobApplicationSchedule);
    }

}
