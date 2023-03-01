/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.candidate;
import com.codeweb.service.CandidateService;
import com.codeweb.service.JobPostingService;
import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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

    @Autowired
    private JobPostingService jobPostingService;

    @Autowired
    JavaMailSender mailSender;

    @ModelAttribute
    public void modelAttribute(Model model,
            @RequestParam(required = false) Map<String, String> params) {
        model.addAttribute("list", this.jobPostingService.getPostByKeyword(params.getOrDefault("keyword", "")));
    }

    @GetMapping("/loginPage")
    public String loginPage(Model model, @RequestParam(value = "error", required = false) String error) {
        try {
            if (error != null) {
                if (error.equals("noRoleSupported")) {
                    model.addAttribute("ERROR", "You have no role to access!");
                }
            }
        } catch (Exception e) {
            System.err.println("ERROR AT ACCOUNT CONTROLLER: " + e.toString());
        }
        return "loginPage";
    }

    @GetMapping("/login")
    public String loginDepartment() {
        return "loginDepartment";
    }

    @GetMapping("/candidate")
    public String loginSuccessfully(Model model,
            Authentication authentication,
            HttpServletRequest request,
            HttpSession session) throws IOException {
        return "redirect:/";
    }
    
    @GetMapping("/department")
    public String loginSuccessfully1(){
        return "department-Page";
    }

    @GetMapping("/account")
    public String account(Model model, HttpSession session) {
        return "account-information";
    }

    public void sendEmail(String from, String to, String subject, String content) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(from);
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);

        mailSender.send(mailMessage);
    }
}
