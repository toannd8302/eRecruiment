/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.candidate;
import com.codeweb.service.CandidateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
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
    
    @RequestMapping("/")
    public String index(Model model){
        return "homePage";
    }
    
}
