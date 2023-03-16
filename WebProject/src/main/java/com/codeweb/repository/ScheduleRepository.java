/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository;

import com.codeweb.pojos.schedule;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface ScheduleRepository {
//    List<schedule> getScheduleByStatus(String status);
    boolean add(schedule schedule);
    boolean update(schedule schedule);
    List<schedule> getScheduleByStatusAndID(String interviewerID, String scheduleStatus, String interviewScheduleStatus);
    List<schedule> getScheduleByID(String scheduleID);
    List<Object[]> getScheduleByStatus(String status);
    List<schedule> getSuitableSchedule(String postID, int roundNumber);
}
