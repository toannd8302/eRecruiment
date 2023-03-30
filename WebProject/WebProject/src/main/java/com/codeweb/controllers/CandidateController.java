/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.candidate;
import com.codeweb.pojos.jobApplication;
import com.codeweb.pojos.jobApplicationSchedule;
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
    private JobPostingService jobPostingService;

    @Autowired
    private JobApplicationService jobApplicationService;

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
            @RequestParam(required = false) Map<String,String> params,
            @RequestParam("postID") String postID) {
        jobApplication.setJobPosting(this.jobPostingService.getPostByID(postID));
        candidate candidate = (candidate) session.getAttribute("user");
        jobApplication.setCandidate(candidate);
        boolean result = this.jobApplicationService.add(jobApplication);
        return "redirect:/";
    }

    @GetMapping("/job/viewMyJob")
    public String viewMyJobApplication(Model model,
            HttpSession session) {
        candidate candidate = (candidate) session.getAttribute("user");
        model.addAttribute("JobApplications", candidate.getJobApplications());
        return "view-JobApplication";
    }
//THIS IS USING FOR TEST
    @GetMapping("/job/view")
    public String view(Model model) {

        List<jobApplication> List = this.jobApplicationService.jobApplicationList();
       jobApplication job = List.get(1);
       model.addAttribute("list", List);
        Set<jobApplicationSchedule> JAPS  = job.getJobApSche();
        model.addAttribute("SSS", JAPS);
        return "Test";
    }
}
