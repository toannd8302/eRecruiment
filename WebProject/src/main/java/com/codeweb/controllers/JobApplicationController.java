/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.controllers;

import com.codeweb.service.JobApplicationService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 *
 * @author toan0
 */
@Controller
@ControllerAdvice
public class JobApplicationController {
    
    @Autowired
    private JobApplicationService jobApplicationService;
    
//    @GetMapping("/test")
//    public String List(Model model){
//        
//        model.addAttribute("List", this.jobApplicationService.viewAllJobApplication());
//        
//        return "test";
//    }
    
     @GetMapping("/jobApplication/{applicationId}")
    public String detailpage(Model model,
            @PathVariable(value = "applicationId") String applicationId,
            HttpSession session){
        model.addAttribute("application",this.jobApplicationService.findJobApplicationById(applicationId));
        return "test";
    }
    
    @GetMapping("/jobApplication/edit/{applicationId}")
    public String editData(Model model,
            @PathVariable(value = "applicationId") String applicationId,
            HttpSession session){
        
        int rows = this.jobApplicationService.editJobApplication(applicationId);
        if(rows ==0){
            return "editApplication";
        }
        return "forward:/test/{applicationId}"; 
    }
    
    
}
