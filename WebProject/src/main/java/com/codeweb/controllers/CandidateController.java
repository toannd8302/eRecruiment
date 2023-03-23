/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.candidate;
import com.codeweb.pojos.jobApplication;
import com.codeweb.pojos.jobApplicationSchedule;
import com.codeweb.service.CandidateService;
import com.codeweb.service.JobApplicationScheduleService;
import com.codeweb.service.JobApplicationService;
import com.codeweb.service.JobPostingService;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
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
public class CandidateController {

    @Autowired
    private CandidateService candidateService;

    @Autowired
    private JobPostingService jobPostingService;

    @Autowired
    private JobApplicationScheduleService jobApplicationScheduleService;

    @Autowired
    private JobApplicationService jobApplicationService;

    //=================APPLY JOB HERE=======================//
    @GetMapping("/job/application")
    public String Job(Model model,
            @RequestParam("data") String postID) {
        model.addAttribute("application", new jobApplication());
        model.addAttribute("jobPost", this.jobPostingService.getPostByID(postID));
        return "apply-job";
    }

    @PostMapping("/job/application")
    public String applyJob(Model model,
            HttpSession session,
            @ModelAttribute(value = "application") jobApplication jobApplication,
            @RequestParam(required = false) Map<String, String> params,
            @RequestParam("postID") String postID) {
        jobApplication.setJobPosting(this.jobPostingService.getPostByID(postID));
        candidate candidate = (candidate) session.getAttribute("user");
        jobApplication.setCandidate(candidate);
        this.jobApplicationService.applyJob(jobApplication);
        return "redirect:/";
    }

    //=================VIEW MY JOB HERE=======================//
    @GetMapping("/job/viewMyJob")
    public String viewMyJobApplication(Model model,
            HttpSession session) {
        candidate candidate = (candidate) session.getAttribute("user");
        model.addAttribute("JobApplications", this.candidateService.findCandidateByID(candidate.getId()).getJobApplications());
        return "view-JobApplication";
    }

    //=================MAKE A DECISION HERE=======================//
    @PostMapping("/job/viewMyJob/schedule-decision")
    public String scheduleDecision(Model model,
            @RequestParam Map<String, String> params) {
        this.jobApplicationScheduleService.scheduleDecision(params.getOrDefault("applicationId", null), params.getOrDefault("scheduleId", null), params.getOrDefault("action", null));
        return "redirect:/job/viewMyJob";
    }

    //================UPDATE INFO OF CANDIDATE HERE=======================//
    @PostMapping("/update")
    public String updateInfor(Model model, @ModelAttribute(value = "candidate") candidate candidate, HttpSession session) {
        candidate candidateToUpdate = (candidate) session.getAttribute("user");
        candidateToUpdate.setName(candidate.getName());
        candidateToUpdate.setPhone(candidate.getPhone());
        candidateToUpdate.setAddress(candidate.getAddress());
        candidateToUpdate.setJobName(candidate.getJobName());
        candidateToUpdate.setExperience(candidate.getExperience());
        this.candidateService.update(candidateToUpdate);
        return "redirect:/account";
    }
}
