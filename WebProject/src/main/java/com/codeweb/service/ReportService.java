/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service;

import com.codeweb.pojos.report;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface ReportService {
    report getReportByReportID(String reportID);
    List<report> getReportByInterviewerID(String interviewerID);
    report getReportByIDs(String jobAppID, String scheduleID, String interviewerID);
    boolean addOrUpdateReport(report report, String action);
}
