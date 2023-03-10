/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.jobApplication;
import com.codeweb.pojos.jobPosting;
import com.codeweb.pojos.schedule;
import com.codeweb.repository.RoundRepository;
import com.codeweb.service.EmployeeService;
import com.codeweb.service.JobApplicationService;
import com.codeweb.service.JobPostingService;
import com.codeweb.service.ScheduleService;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author KHOA
 */
@Controller
@ControllerAdvice
public class employeeController {

    @Autowired
    private JobPostingService jobPostingService;

    @Autowired
    private JobApplicationService jobApplicationService;

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/jobPostings")
    public String viewJobPosting(Model model) {
        Map<String, List<jobPosting>> jobPostingMap = this.jobPostingService.getPostByStatus();
        model.addAttribute("PENDING", jobPostingMap.get("Pending"));
        model.addAttribute("APPROVED", jobPostingMap.get("Approved"));
        model.addAttribute("REJECTED", jobPostingMap.get("Rejected"));
        return "view-all-postings";
    }

    @GetMapping("/jobApps")
    public String viewApplication(Model model) {
        Map<String, List<jobApplication>> jobApplicationMap = this.jobApplicationService.getApplicationByStatus();
        model.addAttribute("REVIEW", jobApplicationMap.get("Review"));
        model.addAttribute("SCHEDULING", jobApplicationMap.get("Scheduling"));
        model.addAttribute("SCHEDULED", jobApplicationMap.get("Scheduled"));
        model.addAttribute("ON_GOING", jobApplicationMap.get("On Going"));
        model.addAttribute("REJECT", jobApplicationMap.get("Fail"));
        return "view-all-apps";
    }

    @GetMapping("/schedules")
    public String viewSchedules(Model model) {
        Map<String, List<Object[]>> scheduleMap = this.scheduleService.getScheduleByStatusV2();
        model.addAttribute("PENDING", scheduleMap.get("Pending"));
        model.addAttribute("ON_GOING", scheduleMap.get("On Going"));
        return "view-all-schedules";
    }

    @GetMapping("/jobApps/job-application-details")
    public String viewJobAppDetails(Model model,
            @RequestParam("jobAppID") String id) {
        model.addAttribute("jobApplication", this.jobApplicationService.getJobApplicationByID(id));
        return "view-application-details";
    }

    @GetMapping("/jobPostings/job-posting-details")
    public String viewJobPostingDetails(Model model,
            @RequestParam("postID") String id) {
        model.addAttribute("jobPosting", this.jobPostingService.getPostByID(id));
        return "view-posting-details";
    }

    @GetMapping("/schedules/schedule-details")
    public String viewScheduleDetails(Model model,
            @RequestParam("scheduleID") String id) {
        model.addAttribute("schedule", this.scheduleService.getScheduleByID(id));
        return "view-schedule-details";
    }

    //START SCHEDULE
    @PostMapping
    public String startSchedule(Model model,
            HttpServletRequest request,
            @RequestParam("scheduleID") String id,
            @RequestParam("action") String action) {
        schedule schedule = this.scheduleService.getScheduleByID(id);
        if (action.equals("start")) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
            Date interviewDate = null;
            Time interviewTime = null;
            String timeStr;
            try {
                interviewDate = dateFormat.parse(request.getParameter("InterviewDate"));
                timeStr = request.getParameter("InterviewTime");
                interviewTime = Time.valueOf(timeStr);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            if(interviewDate != null && interviewTime != null){
                schedule.setScheduleDate(interviewDate);
                schedule.setScheduleTime(interviewTime);
            }
            if(this.scheduleService.update(schedule,action))
                model.addAttribute("MESSAGE","Update schedule successfully");
            else
                model.addAttribute("MESSAGE","Update schedule fail!!!");
        } else {
            model.addAttribute("MESSAGE", "No action supported!!!");
        }
        return "redirect:/schedules";
    }

    //REVIEWING CV
    @PostMapping("/review-app")
    public String reviewJobApp(Model model,
            @RequestParam("jobAppID") String id,
            @RequestParam("action") String action) {
        jobApplication jobApplication = this.jobApplicationService.getJobApplicationByID(id);
        if (action != null) {
            if (action.equals("accept")) {
                this.jobApplicationService.updateAfterReview(jobApplication, true);
            } else if (action.equals("reject")) {
                this.jobApplicationService.updateAfterReview(jobApplication, false);
            }
            model.addAttribute("MESSAGE", "Update CV Successfully");
        } else {
            model.addAttribute("MESSAGE", "No action supported!!!");
        }
        return "redirect:/jobApps";
    }

    //DECIDE POST
    @PostMapping("/evaluate-post")
    public String decidePost(Model model, HttpServletRequest request,
            @RequestParam("postID") String id,
            @RequestParam("action") String action) {
        jobPosting jobPosting = this.jobPostingService.getPostByID(id);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        Date expiredDate = null;
        try {
            expiredDate = dateFormat.parse(request.getParameter("expiredDate"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (expiredDate != null) {
            jobPosting.setExpiredTime(expiredDate);
        }
        if (action != null) {
            if (this.jobPostingService.updateJobPosting(jobPosting, action)) {
                model.addAttribute("MESSAGE", "Accept POSTING Successfully");
            } else {
                model.addAttribute("MESSAGE", "Accept POSTING Fail");
            }
        } else {
            model.addAttribute("MESSAGE", "No action supported!!!");
        }
        return "redirect:/jobPostings";
    }

    //Reject Post
    @PostMapping("/reject-post")
    public String rejectPost(Model model,
            @RequestParam("postID") String id,
            @RequestParam("action") String action) {
        jobPosting jobPosting = this.jobPostingService.getPostByID(id);
        if (action != null) {
            if (this.jobPostingService.updateJobPosting(jobPosting, action)) {
                model.addAttribute("MESSAGE", "Reject POSTING Successfully");
            } else {
                model.addAttribute("MESSAGE", "Reject POSTING Fail");
            }
        } else {
            model.addAttribute("MESSAGE", "No action supported!!!");
        }
        return "redirect:/jobPostings";
    }

    //End Post
    @PostMapping("/end-post")
    public String endPost(Model model,
            @RequestParam("postID") String id,
            @RequestParam("action") String action) {
        jobPosting jobPosting = this.jobPostingService.getPostByID(id);
        if (action != null) {
            if (this.jobPostingService.updateJobPosting(jobPosting, action)) {
                model.addAttribute("MESSAGE", "End POSTING Successfully");
            } else {
                model.addAttribute("MESSAGE", "End POSTING Fail");
            }
        } else {
            model.addAttribute("MESSAGE", "No action supported!!!");
        }
        return "redirect:/jobPostings";
    }

    //AUTOMATICALLY OR MANUALLY SCHEDULNG
    @PostMapping("/schedule-app")
    public String schedulingJobApp(Model model,
            @RequestParam("jobAppID") String id,
            @RequestParam("action") String action) {
        if (action != null) {
            //GET JOB APPLICATION INFORMATION
            jobApplication jobApplication = this.jobApplicationService.getJobApplicationByID(id);
            if (action.equals("auto schedule")) {
                //AUTO SCHEDULING JOB APPLICATION
                String message = this.employeeService.autoSchedulingJobApp(jobApplication);
                model.addAttribute("MESSAGE", message);
                return "redirect:/jobApps";
            } else if (action.equals("manually schedule")) {
                //GET SOME NECCESSARY INFORMATION
                String postID = jobApplication.getJobPosting().getPostId();
                int roundNumber = jobApplication.getRoundNumber() == 0 ? 1 : jobApplication.getRoundNumber();
                //MANUALLY SCHEDULING JOB APPLICATION
                model.addAttribute("jobAppID", id);
                model.addAttribute("postID", postID);
                model.addAttribute("roundNumber", roundNumber);
                model.addAttribute("ScheduleList", this.scheduleService.getSuitableListOfSchedule(postID, roundNumber));
                return "scheduling-job-application";
            }
        } else {
            model.addAttribute("MESSAGE", "No action supported!!!");
        }
        return "redirect:/employee";
    }

    //MANUALLY - CRETAE NEW SCHEDULE
    @PostMapping("/schedule-app/create-new-schedule")
    public String createNewSchedule(Model model,
            @RequestParam("postID") String postID,
            @RequestParam("roundNumber") int roundNumber,
            @RequestParam("jobAppID") String id) {
        if (this.scheduleService.createSchedule(postID, roundNumber) != null) {
            model.addAttribute("MESSAGE", "Successfully create new schedule!!");
        } else {
            model.addAttribute("MESSAGE", "Fail create new schedule!!");
        }
        model.addAttribute("jobAppID", id);
        model.addAttribute("postID", postID);
        model.addAttribute("roundNumber", roundNumber);
        model.addAttribute("ScheduleList", this.scheduleService.getSuitableListOfSchedule(postID, roundNumber));
        return "scheduling-job-application";
    }

    //MANUALLY SCHEDULING WITH A CHOOSED SCHEDULE
    @PostMapping("/schedule-app/choosed-schedule")
    public String chooseSchedule(Model model,
            @RequestParam("jobAppID") String jobAppID,
            @RequestParam("scheduleID") String scheduleID) {
        String message = this.employeeService.manuallySchedulingJobApp(jobAppID, scheduleID);
        model.addAttribute("MESSAGE", message);
        return "redirect:/jobApps";
    }

}
