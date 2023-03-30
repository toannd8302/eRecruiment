/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.report;
import com.codeweb.repository.ReportRepository;
import com.codeweb.service.ReportService;
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
    public List<report> getReportByJobAppID(String jobAppID) {
        return this.reportRepository.getReportByJobAppID(jobAppID);
    }
    
}
