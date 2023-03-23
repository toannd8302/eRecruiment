/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.employee;
import com.codeweb.pojos.jobApplication;
import com.codeweb.service.JobApplicationService;
import com.codeweb.service.JobPostingService;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author KHOA
 */
    @Controller
@ControllerAdvice
public class ManagerController {

    @Autowired
    private JobPostingService jobPostingService;
        
    @Autowired
    private JobApplicationService jobApplicationService;

    //Get all JobApplications with status = Finished
    @GetMapping("/manager/jobapps")
    public String viewAllFinishedJobApp(Model model, HttpSession session) {
        model.addAttribute("JobApps", this.jobApplicationService.getAllFinishedJobApp());
        model.addAttribute("user",(employee)session.getAttribute("user"));
        return "view-all-finshed-job-app";
    }
    // View Detail of 1 JobApplication
    @GetMapping("/manager/jobapps/job-app-detail")
    public String viewJobAppDetail(Model model,@RequestParam("jobAppId") String id){
        model.addAttribute("jobAppDetail", this.jobApplicationService.getJobApplicationByID(id));
        return "view-detail-job-app" ;
    }
    @GetMapping("/manager/post-detail/{postID}")
    public String viewPostDetail(Model model,
            @PathVariable(value = "postID") String postID){
        model.addAttribute("jobPosting",this.jobPostingService.getPostByID(postID));
        return "view-detail-job-post" ;
    }
    @PostMapping("/manager/decision")
    public String decision(Model model,
            @RequestParam(required = false) Map<String,String> params){
        String action = params.getOrDefault("action", "");
        jobApplication jobApp = this.jobApplicationService.getJobApplicationByID(params.getOrDefault("jobAppID", ""));
        if(action.equals("accept")){
            jobApp.setApplicationStatus("Pass");
            this.jobApplicationService.update(jobApp);
        }else if(action.equals("reject")){
            jobApp.setApplicationStatus("Fail");
            this.jobApplicationService.update(jobApp);
        }
        return "redirect:/manager/jobapps" ;
    }
    // => Lấy ra Id 
    // Make Decision => Pass || Fail
}