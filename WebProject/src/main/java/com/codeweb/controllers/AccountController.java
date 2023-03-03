/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.candidate;
import com.codeweb.pojos.department;
import com.codeweb.service.CandidateService;
import com.codeweb.service.DepartmentService;
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
import org.springframework.security.core.context.SecurityContextHolder;
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
    private DepartmentService departmentService;

    @Autowired
    JavaMailSender mailSender;

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

    //Custom a login page
//    @GetMapping("/login")
//    public String loginDepartment() {
//        return "loginDepartment";
//    }

    @GetMapping("/candidate")
    public String loginSuccessfully(Model model,
            @RequestParam(required = false) Map<String, String> params) throws IOException {
        model.addAttribute("list", this.jobPostingService.getPostByKeyword(params.getOrDefault("keyword", "")));
        return "redirect:/";
    }
    
    @GetMapping("/employee")
    public String loginSuccessfully2(){
        return "employee-page";
    }
    
    @GetMapping("/department")
    public String loginSuccessfully1(Model model, HttpSession session){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        department department = this.departmentService.getDepartment(email);
        if(department == null)
            model.addAttribute("ERROR", "No department found");
        session.setAttribute("department", department);
        return "department-Page";
    }

    @GetMapping("/account")
    public String account(Model model) {
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
