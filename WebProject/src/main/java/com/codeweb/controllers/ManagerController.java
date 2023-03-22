/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.controllers;

import com.codeweb.pojos.employee;
import com.codeweb.service.JobApplicationService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author toan0
 */
@Controller
@ControllerAdvice
public class ManagerController {

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
    public String viewDetail(Model model,@RequestParam("jobAppId") String id){
        model.addAttribute("jobAppDetail", this.jobApplicationService.getJobApplicationByID(id));
        return "view-detail-job-app" ;
    }
    // => Lấy ra Id 
    // Make Decision => Pass || Fail

}
