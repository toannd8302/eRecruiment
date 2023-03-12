/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.jobPosting;
import com.codeweb.service.JobPostingService;
import com.codeweb.service.implement.WishListImp;
import java.util.Set;
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
    
    @Autowired
    private WishListImp wishList;
    
    @GetMapping("/post-detail/{postID}")
    public String detailpage(Model model,
            @PathVariable(value = "postID") String postID,
            HttpSession session){
        model.addAttribute("jobPosting",this.jobPostingService.getPostByID(postID));
        return "post-detail-page";
    }
    
    @GetMapping("/post-detail/save/{postID}")
    public String saveJob(HttpSession session,
            @PathVariable(value = "postID") String postID) {
        //NÊN HIỂN THI NAME LÊN URL THÌ TỐT HƠN
        jobPosting jobPostingSave = this.jobPostingService.getPostByID(postID);
        wishList.addToWishList(jobPostingSave);
        //VE HOMPAGE => DANG NHAP MOI XEM DC WISHLIST => WISHLIST NAM TRONG VIEWJOBAPPLICATION
        return "redirect:/";
    }
    
    @GetMapping("/post-detail/view")
    public String viewWishList(HttpSession session) {
        Set<jobPosting> wishlist = wishList.getWishList();
        session.setAttribute("wishList", wishlist);
        return "viewWishList";
    }
    
    @GetMapping("/post-detail/view/delete/{postId}")
    public String deleteJob(HttpSession session, @PathVariable(value = "postId") String postId) {
        jobPosting jobPosting = this.jobPostingService.getPostByID(postId);
        wishList.removeJobPosting(jobPosting);
        return "redirect:/post-detail/view"; 
    }
}
