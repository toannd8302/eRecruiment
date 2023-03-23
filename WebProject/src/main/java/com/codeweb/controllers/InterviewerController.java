/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.employee;
import com.codeweb.pojos.interviewerReasons;
import com.codeweb.pojos.report;
import com.codeweb.pojos.schedule;
import com.codeweb.service.InterviewReasonService;
import com.codeweb.service.JobApplicationService;
import com.codeweb.service.JobPostingService;
import com.codeweb.service.ReportService;
import com.codeweb.service.ScheduleService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author KHOA
 */
@Controller
@ControllerAdvice
public class InterviewerController {

    @Autowired
    private JobPostingService jobPostingService;
    
    @Autowired
    private JobApplicationService jobApplicationService;
    
    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private ReportService reportService;

    @Autowired
    private InterviewReasonService interviewReasonService;
    
    //=================VIEW POST DETAIL HERE=======================//
    @GetMapping("/interviewer/view-post-detail/{postID}")
    public String viewPostDetail(Model model,
            @PathVariable(value = "postID") String postID) {
        model.addAttribute("jobPosting",this.jobPostingService.getPostByID(postID));
        return "intPostDetail";
    }
    
    //=================REPORT HERE=======================//
    @GetMapping("/interviewer/report")
    public String viewReports(Model model, HttpSession session,
            @RequestParam("scheduleID") String scheduleId,
            @RequestParam("jobAppID") String jobAppId) {
        employee employee = (employee) session.getAttribute("user");
        report report = this.reportService.getReportByIDs(jobAppId, scheduleId, employee.getId());
        if(report != null)
            model.addAttribute("report", report);
        else{
            report newReport = new report();
            newReport.setEmployee(employee);
            newReport.setSchedule(this.scheduleService.getScheduleByID(scheduleId));
            newReport.setJobApplication(this.jobApplicationService.getJobApplicationByID(jobAppId));
            model.addAttribute("report", newReport);
        }
        model.addAttribute("candidate", this.jobApplicationService.getJobApplicationByID(jobAppId).getCandidate());
        return "create-report";
    }

    @RequestMapping( value = "/interviewer/report/update", method = RequestMethod.POST)
    public String createUpdateReport(Model model,
            HttpServletRequest request,
            @ModelAttribute(value = "report") report report,
            @RequestParam("action") String action) {
        String scheduleID = report.getSchedule().getScheduleId();
        String userID = report.getEmployee().getId();
        if(action.equals("update")){
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try {
                //Get date
                date = dateFormat.parse(request.getParameter("date"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            if(date!=null)
                report.setCreatedTime(date);
            this.reportService.addOrUpdateReport(report, action);
        }
        if(action.equals("create")){
            this.reportService.addOrUpdateReport(report, action);
        }
        return "redirect:/interviewer/schedules/schedule-detail?scheduleID=" + scheduleID + "&userID=" + userID;
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
            @RequestParam(value = "userID", required = false) String userID,
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
        } else if(action.equals("end")){
            this.scheduleService.endSchedule(this.scheduleService.getScheduleByID(scheduleId));
        }else {
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