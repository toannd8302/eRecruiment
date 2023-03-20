/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.report;
import com.codeweb.repository.ReportRepository;
import com.codeweb.service.ReportService;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KHOA
 */
@Service
public class ReportServiceImp implements ReportService{
    
    @Autowired
    ReportRepository reportRepository;

    @Override
    public List<report> getReportByInterviewerID(String interviewerID) {
        return this.reportRepository.getReportByInterviewerID(interviewerID);
    }

    @Override
    public report getReportByReportID(String reportID) {
        List<report> reports = this.reportRepository.getReportByReportID(reportID);
        if(!reports.isEmpty())
            return reports.get(0);
        else
            return null;
    }

    @Override
    public report getReportByIDs(String jobAppID, String scheduleID, String interviewerID) {
        List<report> reports = this.reportRepository.getReportByIDs(jobAppID, scheduleID, interviewerID);
        if(!reports.isEmpty())
            return reports.get(0);
        else
            return null;
    }

    @Override
    public boolean addOrUpdateReport(report report, String action) {
        if(action.equals("create")){
            // Get the current date and convert the date to java.sql.Date
            Calendar calendar = Calendar.getInstance();
            java.util.Date currentDate = calendar.getTime();
            java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
            report.setCreatedTime(currentDate);
            return this.reportRepository.add(report);
        }else if(action.equals("update")){
            return this.reportRepository.update(report);
        }
        return false;
    }
    
}
