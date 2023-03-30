/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service;

import com.codeweb.pojos.interviewerReasons;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface InterviewReasonService {
    boolean add(interviewerReasons irs);
    boolean update(interviewerReasons irs);
    boolean acceptSchedule(String scheduleId, String userID);
    boolean rejectSchedule(interviewerReasons irs);
    List<interviewerReasons> getIRsByID(String scheduleId, String userID);
}
