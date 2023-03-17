/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.employee;
import com.codeweb.pojos.interviewerReasons;
import com.codeweb.pojos.jobApplication;
import com.codeweb.pojos.jobApplicationSchedule;
import com.codeweb.pojos.round;
import com.codeweb.pojos.schedule;
import com.codeweb.repository.RoundRepository;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codeweb.repository.ScheduleRepository;
import com.codeweb.service.EmployeeService;
import com.codeweb.service.InterviewReasonService;
import com.codeweb.service.JobApplicationService;
import com.codeweb.service.ScheduleService;
import com.codeweb.service.SendMailService;

/**
 *
 * @author KHOA
 */
@Service
public class ScheduleServiceImp implements ScheduleService {
    
    @Autowired
    private SendMailService sendMailService;

    @Autowired
    private RoundRepository roundRepository;

    @Autowired
    private ScheduleRepository scheduleRepository;

    @Autowired
    private JobApplicationService jobApplicationService;

    @Autowired
    private InterviewReasonService interviewReasonService;

    @Autowired
    private EmployeeService employeeService;

    @Override
    public boolean add(schedule schedule) {
        return this.scheduleRepository.add(schedule);
    }

    @Override
    public boolean update(schedule schedule, String action, String[] selectedOptions) {
        if (action.equals("start")) {
            schedule.setStatus("On Going");
            
            //Update jobApplication
            jobApplication jobApp = new jobApplication();
            for (jobApplicationSchedule a : schedule.getjAS()) {
                jobApp = a.getJobApplication();
                jobApp.setApplicationStatus("On Going");
                if (this.jobApplicationService.update(jobApp) == true) {
                    this.sendMailService.sendEmail(jobApp.getCandidate().getEmail(), "You have new interview schedule", "Please check and give us final decision soon.");
                }
            }
            
            //Add interviewerReasons
            employee employee = new employee();
            interviewerReasons irs = new interviewerReasons();
            for (String interviewID : selectedOptions) {
                employee = this.employeeService.findEmployeeByID(interviewID);
                irs.setEmployeeId(interviewID);
                irs.setScheduleId(schedule.getScheduleId());
                irs.setStatus("Pending");
                if (employee != null) {
                    if (this.interviewReasonService.add(irs)) {
                        this.sendMailService.sendEmail(employee.getEmail(), "You have new interview schedule", "Please check and make the final decision as quickly as possible.");
                    }
                }
            }
        }
        return this.scheduleRepository.update(schedule);
    }

    @Override
    public schedule getCurrentScheduleOfJobApp(jobApplication jobApplication) {
        schedule schedule = new schedule();
        int roundNumber = jobApplication.getRoundNumber();
        String scheduleID = new String();
        for (jobApplicationSchedule a : jobApplication.getJobApSche()) {
            if (!a.getStatus().equals("Rejected")) {
                schedule = this.scheduleRepository.getScheduleByID(a.getScheduleId()).get(0);
                if (schedule.getRound().getRoundNumber() == roundNumber) {
                    return schedule;
                }
            }
        }
        return null;
    }

    @Override
    public Map<String, List<Object[]>> getScheduleByStatusV2() {
        Map<String, List<Object[]>> twoDimCollection = new HashMap<>();
        twoDimCollection.put("Pending", this.scheduleRepository.getScheduleByStatus("Pending"));
        twoDimCollection.put("On Going", this.scheduleRepository.getScheduleByStatus("On Going"));
        return twoDimCollection;
    }

    @Override
    public schedule getScheduleByID(String scheduleID) {
        List<schedule> schedules = this.scheduleRepository.getScheduleByID(scheduleID);
        if (schedules.isEmpty()) {
            return null;
        }
        return schedules.get(0);
    }

    @Override
    public List<schedule> getSuitableListOfSchedule(String postID, int roundNumber) {
        return this.scheduleRepository.getSuitableSchedule(postID, roundNumber);
    }

    @Override
    public schedule getSuitableSchedule(String postID, int roundNumber) {
        List<schedule> schedules = this.scheduleRepository.getSuitableSchedule(postID, roundNumber);
        for (schedule schedule : schedules) {
            if (schedule.getjAS().size() < 10) {
                return schedule;
            }
        }
        return null;
    }

    @Override
    public schedule chooseSuitableSchedule(String postID, int roundNumber) {
        schedule schedule = this.getSuitableSchedule(postID, roundNumber);
        if (schedule == null) {
            return this.createSchedule(postID, roundNumber);
        }
        return schedule;
    }

    @Override
    public schedule createSchedule(String postID, int roundNumber) {
        try {
            round round = this.roundRepository.getRounds(postID, roundNumber).get(0);
            schedule newSchedule = new schedule();
            newSchedule.setStatus("Pending");
            newSchedule.setTypeOfInterview(null);
            newSchedule.setRound(round);
            if (this.add(newSchedule)) {
                return newSchedule;
            }
        } catch (Exception e) {
            System.err.println("==CREATE SCHEDULE FAIL AT ScheduleServiceImp(Could be from get round)==" + e.getMessage());
        }
        return null;
    }

    @Override
    public Map<String, List<schedule>> getScheduleOfInterviewer(employee employee) {
        String interviewerID = employee.getId();
        Map<String, List<schedule>> twoDimCollection = new HashMap<>();
        twoDimCollection.put("Pending", this.scheduleRepository.getScheduleByStatusAndID(interviewerID, "On Going", "Pending"));
        twoDimCollection.put("On Going", this.scheduleRepository.getScheduleByStatusAndID(interviewerID, "On Going", "Approved"));
        twoDimCollection.put("Finished", this.scheduleRepository.getScheduleByStatusAndID(interviewerID, "Finished", null));
        return twoDimCollection;
//        return this.scheduleRepository.getScheduleByInterviewerID(interviewerID);
    }
}
