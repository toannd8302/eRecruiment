/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.controllers;

import com.codeweb.pojos.jobPosting;
import com.codeweb.service.JobPostingService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author toan0j
 */
@Controller
@ControllerAdvice
public class DepartmentController {

    @Autowired
    private JobPostingService jobPostingService;

    @GetMapping("/department-homepage")
    public String viewDepartmentHomePage(Model model) {
        model.addAttribute("jobposting", "");
        return "department-home";
    }

    @PostMapping("/department-homepage")
    public String getFormOfDepartments(Model model,
            HttpSession session, @ModelAttribute(value = "jobposting") jobPosting jobPosting) {
        boolean result = this.jobPostingService.addOrUpdate(jobPosting);
        return "department-home";
    }

}
