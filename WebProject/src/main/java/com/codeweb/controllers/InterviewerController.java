/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.employee;
import com.codeweb.pojos.schedule;
import com.codeweb.repository.ScheduleRepository;
import com.codeweb.service.ReportService;
import com.codeweb.service.ScheduleService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author KHOA
 */
@Controller
@ControllerAdvice
public class InterviewerController {
    
    @Autowired
    private ScheduleService scheduleService;
    
    @Autowired
    private ScheduleRepository scheduleRepository;
    
    @Autowired
    private ReportService reportService;
    
    //=================REPORT HERE=======================//
    @GetMapping("/interview/reports")
    public String viewReports(Model model, HttpSession session) {
        employee employee = (employee) session.getAttribute("user");
        model.addAttribute("REPORTS",this.reportService.getReportByInterviewerID(employee.getId()));
        return "view-all-reports";
    }
    
    @GetMapping("/interview/schedules")
    public String viewMySchedules(Model model, HttpSession session) {
        employee employee = (employee) session.getAttribute("user");
        Map<String, List<schedule>> scheduleMap = this.scheduleService.getScheduleOfInterviewer(employee);
        model.addAttribute("PENDING",scheduleMap.get("Pending"));
        model.addAttribute("ON_GOING",scheduleMap.get("On Going"));
        model.addAttribute("FINISHED",scheduleMap.get("Finished"));
        return "view-my-schedules";
    }
}
