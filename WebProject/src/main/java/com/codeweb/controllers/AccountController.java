/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.candidate;
import com.codeweb.service.CandidateService;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author KHOA
 */
@Controller
@ControllerAdvice
public class AccountController {
    @Autowired
    private CandidateService candidateService;
            
    @RequestMapping("/LoginController")
    public String login(Model model,
            @RequestParam(value = "code") String code,
            HttpSession session) throws IOException {
        candidate candidate = this.candidateService.getCandidateByCode(code);
        session.setAttribute("user", candidate);
        return "homePage";
    }
    
    @RequestMapping(path = "/LogoutController", method = RequestMethod.GET)
    public String logout(Model model, HttpSession session){
        if(session!=null)
            session.invalidate();
        return "redirect:/";
    }
    
}
