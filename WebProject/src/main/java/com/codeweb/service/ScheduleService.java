/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service;

import com.codeweb.pojos.employee;
import com.codeweb.pojos.jobApplication;
import com.codeweb.pojos.schedule;
import java.util.List;
import java.util.Map;

/**
 *
 * @author KHOA
 */
public interface ScheduleService {
    boolean add(schedule schedule);
    boolean update(schedule schedule, String action, String[] selectedOptions);
    boolean endSchedule(schedule schedule);
    schedule getCurrentScheduleOfJobApp(jobApplication jobApplication);
    Map<String,List<schedule>> getScheduleOfInterviewer(employee interviewer);
    Map<String,List<Object[]>> getScheduleByStatusV2();
    schedule getScheduleByID(String scheduleID);
    schedule createSchedule(String postID, int roundNumber);
    List<schedule> getSuitableListOfSchedule(String postID, int roundNumber);
    schedule getSuitableSchedule(String postID, int roundNumber);
    schedule chooseSuitableSchedule(String postID, int roundNumber);
}
