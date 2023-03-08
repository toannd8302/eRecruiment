/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.candidate;
import com.codeweb.service.CandidateService;
import com.codeweb.service.JobPostingService;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    private JobPostingService jobPostingService;
    
    @RequestMapping("/")
    public String index(Model model,
            @RequestParam(required = false) Map<String,String> params,
            HttpSession session){
        model.addAttribute("isLoginPage", true);
        model.addAttribute("list", this.jobPostingService.getPostByKeyword(params.getOrDefault("keyword", "")));
        return "homePage";
    }
}
