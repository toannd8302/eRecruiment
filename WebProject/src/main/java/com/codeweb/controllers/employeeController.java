/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.interviewerReasons;
import com.codeweb.pojos.jobApplication;
import com.codeweb.pojos.jobPosting;
import com.codeweb.pojos.schedule;
import com.codeweb.service.EmployeeService;
import com.codeweb.service.JobApplicationScheduleService;
import com.codeweb.service.JobApplicationService;
import com.codeweb.service.JobPostingService;
import com.codeweb.service.ScheduleService;
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
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author KHOA
 */
@Controller
@ControllerAdvice
public class employeeController {

    @Autowired
    private JobApplicationScheduleService jobApplicationScheduleService;
    
    @Autowired
    private JobPostingService jobPostingService;

    @Autowired
    private JobApplicationService jobApplicationService;

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private EmployeeService employeeService;

    //=================JOB POSTING HERE=======================//
    @GetMapping("/jobPostings")
    public String viewJobPosting(Model model) {
        Map<String, List<jobPosting>> jobPostingMap = this.jobPostingService.getPostByStatus();
        model.addAttribute("PENDING", jobPostingMap.get("Pending"));
        model.addAttribute("APPROVED", jobPostingMap.get("Approved"));
        model.addAttribute("REJECTED", jobPostingMap.get("Rejected"));
        return "view-all-postings";
    }

    @GetMapping("/jobPostings/job-posting-details")
    public String viewJobPostingDetails(Model model,
            @RequestParam("postID") String id) {
        model.addAttribute("jobPosting", this.jobPostingService.getPostByID(id));
        return "view-posting-details";
    }

    //DECIDE POST, ACCEPT/REJECT
    @PostMapping("/jobPostings/job-posting-details/evaluate-post")
    public String decidePost(Model model, HttpServletRequest request,
            @RequestParam("postID") String id,
            @RequestParam("action") String action,
            @RequestParam(name = "isHotJob", required = false, defaultValue = "false") boolean isHotJob) {
        jobPosting jobPosting = this.jobPostingService.getPostByID(id);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date expiredDate = null;
        if (action.equals("accept")) {
            try {
                expiredDate = dateFormat.parse(request.getParameter("expiredDate"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            if (expiredDate != null) {
                jobPosting.setExpiredTime(expiredDate);
            }
            jobPosting.setHotJob(isHotJob);
            if (this.jobPostingService.updateJobPosting(jobPosting, action)) {
                model.addAttribute("MESSAGE", "Accept POSTING Successfully");
            } else {
                model.addAttribute("MESSAGE", "Accept POSTING Fail");
            }
        } else if (action.equals("reject")) {
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

//    //Reject Post
//    @PostMapping("/jobPostings/job-posting-details/reject-post")
//    public String rejectPost(Model model,
//            @RequestParam("postID") String id,
//            @RequestParam("action") String action) {
//        jobPosting jobPosting = this.jobPostingService.getPostByID(id);
//        if (action != null) {
//            if (this.jobPostingService.updateJobPosting(jobPosting, action)) {
//                model.addAttribute("MESSAGE", "Reject POSTING Successfully");
//            } else {
//                model.addAttribute("MESSAGE", "Reject POSTING Fail");
//            }
//        } else {
//            model.addAttribute("MESSAGE", "No action supported!!!");
//        }
//        return "redirect:/jobPostings";
//    }
    //End Post
    @PostMapping("/jobPostings/job-posting-details/end-post")
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

    //=================JOB APPLICATION HERE=======================//
    @GetMapping("/jobApps")
    public String viewApplication(Model model) {
        Map<String, List<jobApplication>> jobApplicationMap = this.jobApplicationService.getApplicationByStatus();
        model.addAttribute("REVIEW", jobApplicationMap.get("Review"));
        model.addAttribute("SCHEDULING", jobApplicationMap.get("Scheduling"));
        model.addAttribute("SCHEDULED", jobApplicationMap.get("Scheduled"));
        model.addAttribute("ON_GOING", jobApplicationMap.get("On Going"));
        model.addAttribute("FINISHED", jobApplicationMap.get("Finished"));
        model.addAttribute("REJECT", jobApplicationMap.get("Fail"));
        return "view-all-apps";
    }

    @GetMapping("/jobApps/job-application-details")
    public String viewJobAppDetails(Model model,
            @RequestParam("jobAppID") String id) {
        jobApplication jobApp = this.jobApplicationService.getJobApplicationByID(id);
        model.addAttribute("jobApplication", jobApp);
        schedule schedule = this.scheduleService.getCurrentScheduleOfJobApp(jobApp);
        if (schedule != null) {
            model.addAttribute("scheduleID", schedule.getScheduleId());
            model.addAttribute("status", this.jobApplicationScheduleService.getByIDs(id, schedule.getScheduleId()).getStatus());
        }
        return "view-application-details";
    }

    //REVIEWING CV
    @PostMapping("/jobApps/job-application-details/review-app")
    public String reviewJobApp(Model model,
            @RequestParam("jobAppID") String id,
            @RequestParam("action") String action) {
        jobApplication jobApplication = this.jobApplicationService.getJobApplicationByID(id);
        if (action != null) {
            if (action.equals("accept")) {
                if (this.jobApplicationService.updateAfterReview(jobApplication, true) == false) {
                    model.addAttribute("MESSAGE", "Update CV Fail!!");
                    return "redirect:/jobApps";
                }
            }
            if (action.equals("reject")) {
                if (this.jobApplicationService.updateAfterReview(jobApplication, false) == false) {
                    model.addAttribute("MESSAGE", "Update CV Fail!!");
                    return "redirect:/jobApps";
                }
            }
            model.addAttribute("MESSAGE", "Update CV Successfully");
        } else {
            model.addAttribute("MESSAGE", "No action supported!!!");
        }
        return "redirect:/jobApps";
    }

    //AUTOMATICALLY OR MANUALLY SCHEDULNG
    @PostMapping("/jobApps/job-application-details/schedule-app")
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

    //=================SCHEDULES HERE=======================//
    @GetMapping("/schedules")
    public String viewSchedules(Model model) {
        Map<String, List<Object[]>> scheduleMap = this.scheduleService.getScheduleByStatusV2();
        model.addAttribute("PENDING", scheduleMap.get("Pending"));
        model.addAttribute("ON_GOING", scheduleMap.get("On Going"));
        return "view-all-schedules";
    }

    @GetMapping("/schedules/schedule-details")
    public String viewScheduleDetails(Model model,
            @RequestParam("scheduleID") String id) {
        schedule schedule = this.scheduleService.getScheduleByID(id);
        String stringMatch = new String();
        for (interviewerReasons i : schedule.getiRS()) {
            stringMatch += new String(i.getEmployeeId() + ", ");
        }
        model.addAttribute("stringMatch", stringMatch);
        model.addAttribute("schedule", schedule);
        model.addAttribute("listInterviewers", this.employeeService.getEmployeesByRole("ROLE_INTERVIEWER"));
        return "view-schedule-details";
    }

    //START SCHEDULE
    @PostMapping("/schedules/schedule-details/start-schedule")
    public String startSchedule(Model model,
            HttpServletRequest request,
            @RequestParam("scheduleID") String id,
            @RequestParam("action") String action,
            @RequestParam("Location") String location,
            @RequestParam(name = "typeOfInterview", required = false, defaultValue = "false") boolean typeOfInterview) {
        if (action.equals("start")) {
            //Get and set the list of interviewerReasons of schedule
            String[] selectedOptions = request.getParameterValues("interviewers");
            //Get schedule
            schedule schedule = this.scheduleService.getScheduleByID(id);
            //Set location and type
            schedule.setLocation(location);
            schedule.setTypeOfInterview(typeOfInterview);
            //Get and set date and time
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            Date interviewDate = null;
            Date interviewTime = null;
            try {
                //Get date
                interviewDate = dateFormat.parse(request.getParameter("InterviewDate"));
                //Get time
                interviewTime = timeFormat.parse(request.getParameter("InterviewTime"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            if (interviewDate != null) {
                schedule.setScheduleDate(interviewDate);
            }
            if (interviewTime != null) {
                java.sql.Time sqlTime = new java.sql.Time(interviewTime.getTime());
                schedule.setScheduleTime(sqlTime);
            }
            //Update schedule (new set of interviewerReasons, new date and time)
            if (this.scheduleService.update(schedule, action, selectedOptions)) {
                model.addAttribute("MESSAGE", "Update schedule successfully");
            } else {
                model.addAttribute("MESSAGE", "Update schedule fail!!!");
            }

        } else {
            model.addAttribute("MESSAGE", "No action supported!!!");
        }
        return "redirect:/schedules";
    }
}
