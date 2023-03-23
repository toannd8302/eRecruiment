/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.service.JobPostingService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
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
    private JobPostingService jobPostingService;
    
    @RequestMapping("/")
    public String index(Model model,
            @RequestParam(required = false) Map<String,String> params){
        model.addAttribute("listOfJobPosting", this.jobPostingService.getPostByKeyword(params.getOrDefault("keyword", "")));
        model.addAttribute("listOfHotJob", this.jobPostingService.getAllHotJob());
        return "homePage";
    }
}
