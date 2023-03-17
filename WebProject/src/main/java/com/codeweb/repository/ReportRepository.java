/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository;

import com.codeweb.pojos.report;
import com.codeweb.pojos.schedule;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface ReportRepository {
    List<report> getReportByInterviewerID(String interviewerId);
    List<report> getReportByJobAppID(String jobAppID);
}
