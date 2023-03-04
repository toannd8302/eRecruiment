/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.jobPosition;
import com.codeweb.pojos.jobPosting;
import com.codeweb.service.implement.JobPositionServiceImp;
import com.codeweb.service.implement.JobPostingServiceImp;
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
 * @author toan0
 */
@Controller
@ControllerAdvice
public class DepartmentController {
    
     @Autowired
    private JobPostingServiceImp jobPostingServiceImp;

    @Autowired
    private JobPositionServiceImp jobPositionServiceImp;

    @GetMapping("/createjobposting")
    public String viewDepartmenJobPosting(Model model) {
        jobPosting jobPosting = new jobPosting();

        model.addAttribute("joPositions", this.jobPositionServiceImp.getAllJobPositions());
        model.addAttribute("jobPosting", jobPosting);
        model.addAttribute("jobPosition", new jobPosition());
        return "createjobPosting";
    }

    @PostMapping("/createjobposting")
    public String getFormOfDepartments(@ModelAttribute(value = "jobPosting")jobPosting jobPosting,
                @RequestParam(value = "jobId")String jobId) {
         jobPosition jobPosition  = jobPosting.getJobPosition();
//        model.addAttribute("jobPosition", jobPosition);
//        boolean result = this.jobPostingServiceImp.addOrUpdate(jobPosting);
        return "createjobPosting";
    }
    
}
