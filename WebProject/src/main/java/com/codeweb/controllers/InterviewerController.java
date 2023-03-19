/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.codeweb.pojos.employee;
import com.codeweb.pojos.interviewerReasons;
import com.codeweb.pojos.schedule;
import com.codeweb.service.InterviewReasonService;
import com.codeweb.service.ReportService;
import com.codeweb.service.ScheduleService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    private ReportService reportService;

    @Autowired
    private InterviewReasonService interviewReasonService;

    //=================REPORT HERE=======================//
    @GetMapping("/interviewer/reports")
    public String viewReports(Model model, HttpSession session) {
        employee employee = (employee) session.getAttribute("user");
        model.addAttribute("REPORTS", this.reportService.getReportByInterviewerID(employee.getId()));
        return "view-my-reports";
    }

    @GetMapping("/interviewer/reports/report-detail")
    public String viewReportDetail(Model model,
            @RequestParam("reportID") String id) {
        model.addAttribute("report", this.reportService.getReportByReportID(id));
        return "view-my-report-details";
    }

    //=================SCHEDULE HERE=======================//
    @GetMapping("/interviewer/schedules")
    public String viewMySchedules(Model model, HttpSession session) {
        employee employee = (employee) session.getAttribute("user");
        Map<String, List<schedule>> scheduleMap = this.scheduleService.getScheduleOfInterviewer(employee);
        model.addAttribute("PENDING", scheduleMap.get("Pending"));
        model.addAttribute("ON_GOING", scheduleMap.get("On Going"));
        model.addAttribute("FINISHED", scheduleMap.get("Finished"));
        model.addAttribute("REJECTED", scheduleMap.get("Rejected"));
        model.addAttribute("userID", employee.getId());
        return "view-my-schedules";
    }

    @GetMapping("/interviewer/schedules/schedule-detail")
    public String viewScheduleDetail(Model model,
            @RequestParam("scheduleID") String scheduleId,
            @RequestParam("userID") String userID) {
        List<interviewerReasons> irsList = this.interviewReasonService.getIRsByID(scheduleId, userID);
        model.addAttribute("status", irsList.get(0));
        model.addAttribute("schedule", this.scheduleService.getScheduleByID(scheduleId));
        model.addAttribute("userID", userID);
        return "view-my-schedule-details";
    }

    @PostMapping("/interviewer/schedules/schedule-detail/decision")
    public String scheduleDecision(Model model,
            @RequestParam("scheduleID") String scheduleId,
            @RequestParam("userID") String userID,
            @RequestParam("action") String action) {
        if (action.equals("accept")) {
            if (this.interviewReasonService.acceptSchedule(scheduleId, userID)) {
                model.addAttribute("MESSAGE", "Accept Schedule Successfully");
            } else {
                model.addAttribute("MESSAGE", "Error: Accept Schedule Fail!!!");
            }
            return "redirect:/interviewer/schedules";
        } else if (action.equals("reject")) {
            interviewerReasons irs = this.interviewReasonService.getIRsByID(scheduleId, userID).get(0);
            model.addAttribute("IRS", irs);
            return "reject-schedule";
        } else {
            model.addAttribute("MESSAGE", "No action supported!!!");
        }
        return "redirect:/interviewer/schedules";
    }

    @PostMapping("/interviewer/schedules/schedule-detail/reject")
    public String scheduleRejection(Model model,
            @ModelAttribute(value = "IRS") interviewerReasons irs,
            @RequestParam("action") String action) {
        if (action.equals("reject")) {
            if(this.interviewReasonService.rejectSchedule(irs))
                model.addAttribute("MESSAGE", "Reject Schedule Successfully");
            else
                model.addAttribute("MESSAGE", "ERROR: Reject Schedule Fail!!!");
            return "redirect:/interviewer/schedules";
        } else {
            model.addAttribute("MESSAGE", "No action supported!!!");
        }
        return "redirect:/interviewer/schedules";
    }
}
