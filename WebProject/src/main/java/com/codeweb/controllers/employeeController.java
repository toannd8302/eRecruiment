/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.jobApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author KHOA
 */
@Controller
@ControllerAdvice
public class employeeController {
    
    @GetMapping("/jobPostings")
    public String viewJobPosting(Model model) {
        model.addAttribute("PostList", new jobApplication());
        return "view-all-postings";
    }
    
    @GetMapping("/jobApps")
    public String viewApplication(Model model) {
        model.addAttribute("PostList", new jobApplication());
        return "view-all-apps";
    }
    
    @GetMapping("/schedules")
    public String viewSchedules(Model model) {
        model.addAttribute("PostList", new jobApplication());
        return "view-all-schedules";
    }
}
