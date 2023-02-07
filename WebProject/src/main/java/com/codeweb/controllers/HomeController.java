/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.service.CandidateService;
import com.codeweb.service.JobpostingService;
import com.codeweb.service.SkillService;
import javax.persistence.Query;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author KHOA
 */
@Controller
@ControllerAdvice
public class HomeController {

    @Autowired
    private CandidateService candidateService;

    @Autowired
    private SkillService skillService;
    
    @Autowired
    private JobpostingService jobpostingService;
    
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @RequestMapping("/")
    @Transactional
    public String index(Model model) {
        model.addAttribute("skills", this.skillService.getSkills());
        model.addAttribute("jobposting", this.jobpostingService.getJobposting());
        return "homePage";
    }

}
