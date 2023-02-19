/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.service.JobPostingService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author KHOA
 */
@Controller
@ControllerAdvice
public class JobPostingController {
    @Autowired
    private JobPostingService jobPostingService;
    
    @GetMapping("/post-detail/{postID}")
    public ModelAndView detailpage(Model model,
            @PathVariable(value = "postID") String postID,
            HttpSession session){
        ModelAndView mdv = new  ModelAndView();
        mdv.setViewName("post-detail-page");
        mdv.addObject("jobPosting",this.jobPostingService.getPostByID(postID));
        return mdv;
    }
}
