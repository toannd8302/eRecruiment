/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.jobApplication;
import com.codeweb.pojos.round;
import com.codeweb.pojos.schedule;
import com.codeweb.repository.RoundRepository;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codeweb.repository.ScheduleRepository;
import com.codeweb.service.ScheduleService;
import java.util.ArrayList;

/**
 *
 * @author KHOA
 */
@Service
public class ScheduleServiceImp implements ScheduleService {

    @Autowired
    private RoundRepository roundRepository;

    @Autowired
    private ScheduleRepository scheduleRepository;

    @Override
    public boolean add(schedule schedule) {
        return this.scheduleRepository.add(schedule);
    }
    
    @Override
    public boolean update(schedule schedule, String action) {
        if(action.equals("start")){
            schedule.setStatus("On Going");
        }
        return this.scheduleRepository.update(schedule);
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
        if(schedules.isEmpty()){
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
            if (this.add(newSchedule))
                return newSchedule;
        } catch (Exception e) {
            System.err.println("==CREATE SCHEDULE FAIL AT ScheduleServiceImp(Could be from get round)==" + e.getMessage());
        }
        return null;
    }
}
