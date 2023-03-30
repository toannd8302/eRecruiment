/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.common.CustomOAuth2User;
import com.codeweb.pojos.employee;
import com.codeweb.pojos.interviewerReasons;
import com.codeweb.pojos.round;
import com.codeweb.pojos.jobApplication;
import com.codeweb.pojos.jobApplicationSchedule;
import com.codeweb.pojos.schedule;
import com.codeweb.repository.EmployeeRepository;
import com.codeweb.repository.JobAppScheduleRepository;
import com.codeweb.repository.JobApplicationRepository;
import com.codeweb.repository.RoundRepository;
import com.codeweb.service.EmployeeService;
import com.codeweb.service.JobApplicationService;
import com.codeweb.service.ScheduleService;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KHOA
 */
@Service
public class EmployeeServiceImp implements EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private JobAppScheduleRepository jobAppScheduleRepository;
    
    @Autowired
    private JobApplicationService jobApplicationService;

    @Override
    public List<employee> getAll() {
        return this.employeeRepository.getAll();
    }
    
    @Override
    public List<employee> getEmployeesByRole(String role) {
        return this.employeeRepository.getEmployeeByRole(role);
    }

    @Override
    public boolean addOrUpdate(employee employee) {
        return this.employeeRepository.addOrUpdate(employee);
    }

    @Override
    public employee findEmployeeByID(String id) {
        List<employee> employees = this.employeeRepository.getEmployeeById(id);
        if (!employees.isEmpty()) {
            return employees.get(0);
        } else {
            return null;
        }
    }

    @Override
    public employee findEmployeeByEmail(String email) {
        List<employee> employees = this.employeeRepository.getEmployeeByEmail(email);
        if (!employees.isEmpty()) {
            return employees.get(0);
        } else {
            return null;
        }
    }

    @Override
    public employee processOAuthPostLogin(CustomOAuth2User oauthUser) {
        String email = oauthUser.getEmail();
        employee existUser = this.findEmployeeByEmail(email);
        if (existUser != null) {
            return existUser;
        }
        return null;
    }

    @Override
    public String autoSchedulingJobApp(jobApplication jobApplication) {
        try {
            //GET POST'S ID AND ROUND NUMBER FOR FINDING CORRECT EXISTED SCHEDULE
            String postID = jobApplication.getJobPosting().getPostId();
            int roundNumber = jobApplication.getRoundNumber() == 0 ? 1 : jobApplication.getRoundNumber();

            //UPDATE JOB_APPLICATION INFORMATION
            jobApplication.setRoundNumber(roundNumber);
            jobApplication.setApplicationStatus("Scheduled");

            //GET EXISTED SCHEDULE OR CREATE NEW SCHEDULE, IT CAN BR NULL
            schedule schedule = this.scheduleService.chooseSuitableSchedule(postID, roundNumber);

            //CREATE A NEW JOB_APPLICATION_SCHEDULE, SET VALUES FOR ALL FIELDS
            jobApplicationSchedule jobApplicationSchedule = new jobApplicationSchedule();
            jobApplicationSchedule.setApplicationId(jobApplication.getApplicationId());
            jobApplicationSchedule.setScheduleId(schedule.getScheduleId());
            jobApplicationSchedule.setStatus("Pending");
            jobApplicationSchedule.setReason_content(null);
            jobApplicationSchedule.setFilepath(null);

            if (this.jobAppScheduleRepository.add(jobApplicationSchedule) == false) {
                return "Error when scheduling job application with a schedule";
            }
            if (this.jobApplicationService.update(jobApplication) == false) {
                return "Error when update job application";
            }

            return "Successfully scheduling";
        } catch (Exception e) {
            System.err.println("Error at autoSchedulingJobApp: " + e.toString());
        }
        return "There is error when scheduling (can be null exception)";
    }

    @Override
    public String manuallySchedulingJobApp(String jobAppID, String scheduleID) {
        jobApplication jobApplication = this.jobApplicationService.getJobApplicationByID(jobAppID);
        int roundNumber = jobApplication.getRoundNumber() == 0 ? 1 : jobApplication.getRoundNumber();
        jobApplication.setRoundNumber(roundNumber);
        jobApplication.setApplicationStatus("Scheduled");

        jobApplicationSchedule jobApplicationSchedule = new jobApplicationSchedule();
        jobApplicationSchedule.setApplicationId(jobAppID);
        jobApplicationSchedule.setScheduleId(scheduleID);
        jobApplicationSchedule.setStatus("Pending");
        jobApplicationSchedule.setReason_content(null);
        jobApplicationSchedule.setFilepath(null);

        if (this.jobAppScheduleRepository.add(jobApplicationSchedule) == false || this.jobApplicationService.update(jobApplication) == false) {
            return "Error when manually scheduling job application with a schedule";
        } else {
            return "Successfully manually scheduling job application";
        }
    }
}
