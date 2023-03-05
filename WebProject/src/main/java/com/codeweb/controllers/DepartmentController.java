/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.department;
import com.codeweb.pojos.jobPosition;
import com.codeweb.pojos.jobPosting;
import com.codeweb.service.JobPositionService;
import com.codeweb.service.JobPostingService;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author toan0
 */
@Controller
@ControllerAdvice
public class DepartmentController {

    @Autowired
    private JobPositionService jobPositionService;
    @Autowired
    private JobPostingService jobPostingService;

    @GetMapping("/createjobposting")
    public String viewDepartmenJobPosting(Model model) {
        model.addAttribute("jobPosting", new jobPosting());

        List<jobPosition> Positiions = this.jobPositionService.getAll();

        model.addAttribute("joPositions", Positiions);
//jobPosition jobPosition  =jobPositionService.getbyId("J0002");
//        model.addAttribute("jobPosition", jobPosition);
        return "formJobPosting";
    }

    @PostMapping("/createjobposting")
    public String getFormOfDepartments(@ModelAttribute(value = "jobPosting") jobPosting jobPosting,
            BindingResult result, Model model, HttpSession session
    ) {

        if (result.hasErrors()) {
            List<jobPosition> jobPositions = jobPositionService.getAll();
            model.addAttribute("joPositions", jobPositions);
            return "formJobPosting";
        }
        //
        department department = (department) session.getAttribute("department");

        String jobId = jobPosting.getJobPosition().getJobId();
        jobPosition jobposition = this.jobPositionService.getbyId(jobId);
        if (jobposition.getDepartment().getDepartmentId().equals(department.getDepartmentId())) {
            jobPosting.setJobPosition(jobposition);

            boolean Result = this.jobPostingService.create(jobPosting);
            if (Result == true) {
                return "redirect:/";
            }

        } else {

            session.setAttribute("ERROR", "PLS INPUT JOBTITLE SUITABLY");
            List<jobPosition> jobPositions = jobPositionService.getAll();
            model.addAttribute("joPositions", jobPositions);

        }
        return "formJobPosting";

    }
}
