/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.controllers;

import com.codeweb.pojos.jobPosition;
import com.codeweb.pojos.jobPosting;
import com.codeweb.pojos.round;
import com.codeweb.service.JobPostingService;
import com.codeweb.service.RoundService;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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

public class RoundController {
    
    @Autowired
    private RoundService RoundService;
    
    @Autowired
    private JobPostingService JobPostingService;

    //Forward => Chỉ hỗ rợ cho phương thức POST
    @PostMapping(value = "/viewround")
    public String showFormCreateRound(Model model) {
        model.addAttribute("round", new round());
        model.addAttribute("jobPostings", this.JobPostingService.getAllJobPosting());
        return "departmentCreateRound";
    }
    
    @PostMapping(value = "/createround")
    public String createRound(@ModelAttribute(value = "round") round round,
            BindingResult result, Model model, HttpSession session)
           {
        
        if (result.hasErrors()) {
            
            return "forward:/viewround";
        }
       String PostId =  round.getJobPosting().getPostId();
        round.setContent(round.getContent());
        round.setRoundNumber(round.getRoundNumber());
        round.setJobPosting(this.JobPostingService.getPostByID(PostId));
        this.RoundService.createRound(round);
        
        return "redirect:/createjobposting";
    }
    
}
