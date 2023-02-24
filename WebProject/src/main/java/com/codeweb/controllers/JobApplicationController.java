/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.codeweb.pojos.candidate;
import com.codeweb.pojos.jobApplication;
import com.codeweb.pojos.jobApplicationSchedule;
import com.codeweb.pojos.schedule;
import com.codeweb.service.CandidateService;
import com.codeweb.service.JobApplicationService;
import com.codeweb.service.JobPostingService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.ejb.Schedule;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author KHOA
 */
@Controller
@ControllerAdvice
public class JobApplicationController {

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private CandidateService candidateService;

    @Autowired
    private JobPostingService jobPostingService;

    @Autowired
    private JobApplicationService jobApplicationService;

    @Autowired
    private JavaMailSender mailSender;

    @GetMapping("/job/application")
    public String Job(Model model,
            HttpSession session,
            @RequestParam("data") String postID) {
        model.addAttribute("application", new jobApplication());
        model.addAttribute("postID", postID);
        return "apply-job";
    }

    @PostMapping("/job/application")
    public String applyJob(Model model,
            HttpSession session,
            @ModelAttribute(value = "application") jobApplication jobApplication,
            @RequestParam("postID") String postID) {
        jobApplication.setJobPosting(this.jobPostingService.getPostByID(postID));
        candidate candidate = (candidate) session.getAttribute("user");
        jobApplication.setCandidate(candidate);

        boolean result = this.jobApplicationService.addOrUpdate(jobApplication);
        //GUI MAIL CAI LICH CHO USER LUON
//        String userEmail = candidate.getEmail();
//        List<schedule> scheduleList = new ArrayList<>();
//        for (jobApplication JOA : candidate.getJobApplications()) {
//
//            for (jobApplicationSchedule JAS : JOA.getJobApSche()) {
//
//                scheduleList.add(JAS.getSchedule());     
//            }
//        }
//        schedule schedule = new schedule();
//        Date scheduleDate = schedule.getScheduleDate();
//        for (schedule s : scheduleList) {
//            scheduleDate = s.getScheduleDate();
//        }
//        sendEmail("toanndse161748@fpt.edu.vn", userEmail, "Intervew_schedule of your position", scheduleDate);

        return "homePage";
    }

    @GetMapping("/job/viewMyJob")
    public String viewMyJobApplication(Model model,
            HttpSession session) {
        candidate candidate = (candidate) session.getAttribute("user");
        model.addAttribute("JobApplications", candidate.getJobApplications());
        return "view-JobApplication";
    }
//THIS IS USING FOR TEST

    @GetMapping("/job/view")
    public String view(Model model) {

        List<jobApplication> List = this.jobApplicationService.jobApplicationList();
        jobApplication job = List.get(1);
        model.addAttribute("list", List);
        Set<jobApplicationSchedule> JAPS = job.getJobApSche();
        model.addAttribute("SSS", JAPS);
        return "Test";
    }

    public void sendEmail(String from, String to, String subject, Date schedule) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(from);
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setSentDate(schedule);

        mailSender.send(mailMessage);
    }
}
