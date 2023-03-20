/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.candidate;
import com.codeweb.pojos.jobApplication;
import com.codeweb.pojos.jobPosting;
import com.codeweb.service.CandidateService;
import com.codeweb.service.JobPostingService;
import com.codeweb.service.WishListService;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    
    @Autowired
    private WishListService wishListService;
    
    @Autowired
    private CandidateService candidateService;
    
    @GetMapping("/post-detail/{postID}")
    public String detailpage(Model model,
            @PathVariable(value = "postID") String postID){
        model.addAttribute("jobPosting",this.jobPostingService.getPostByID(postID));
        return "post-detail-page";
    }
    
    @GetMapping("/post-detail/save/{postID}")
    public String saveJob(HttpSession session,
            @PathVariable(value = "postID") String postID) {
        //NÊN HIỂN THI NAME LÊN URL THÌ TỐT HƠN
        jobPosting jobPosting = this.jobPostingService.getPostByID(postID);
        candidate candidate = (candidate) session.getAttribute("user");
        this.wishListService.addToWishList(candidate, jobPosting);
        //VE HOMPAGE => DANG NHAP MOI XEM DC WISHLIST => WISHLIST NAM TRONG VIEWJOBAPPLICATION
        return "redirect:/";
    }
    
    @GetMapping("/post-detail/view")
    public String viewWishList(HttpSession session) {
        candidate candidate = (candidate) session.getAttribute("user");
        session.setAttribute("JobPostings", candidate.getJobPostings());
        return "viewWishList";
    }
    
    @GetMapping("/post-detail/view/delete/{postId}")
    public String deleteJob(HttpSession session, Model model,
            @PathVariable(value = "postId") String postId) {
        jobPosting jobPosting = this.jobPostingService.getPostByID(postId);
        candidate candidate = (candidate) session.getAttribute("user");
        
//        Set<jobPosting> set = candidate.getJobPostings();
//        boolean result = set.remove(jobPosting);
//        
//        model.addAttribute("RESULT",result);
//        return "viewWishList";
        this.wishListService.removeJobPosting(candidate,jobPosting);
        return "redirect:/post-detail/view"; 
    }
}
