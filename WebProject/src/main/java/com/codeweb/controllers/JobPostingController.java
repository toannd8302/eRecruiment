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
    
    @GetMapping("/post-detail/{postID}")
    public ModelAndView detailpage(Model model,
            @PathVariable(value = "postID") String postID,
            HttpSession session){
        ModelAndView mdv = new  ModelAndView();
        mdv.setViewName("post-detail-page");
        mdv.addObject("jobPosting",this.jobPostingService.getPostByID(postID));
        return mdv;
    }
    
    @Autowired
    private WishListImp wishList; //ĐƯỢC TẠO TRONG SERVICE
    @GetMapping("/post-detail/save/{postID}")
    public String saveJob(HttpSession session,
            @PathVariable(value = "postID") String postID) {
            //NÊN HIỂN THI NAME LÊN URL THÌ TỐT HƠN
           jobPosting jobPostingSave = this.jobPostingService.getPostByID(postID);
//           List<jobPosting>list = new ArrayList<>();
//          list.add(jobPostingSave);
//           session.setAttribute("List", list);

           wishList.addToWishList(jobPostingSave);
           //VE HOMPAGE => DANG NHAP MOI XEM DC WISHLIST => WISHLIST NAM TRONG VIEWJOBAPPLICATION
        return "homePage";
    }
     @GetMapping("/post-detail/view")
     public String viewWishList(Model model){
         Set<jobPosting>wishlist = wishList.getWishList();
         model.addAttribute("wishList", wishlist);
         return "viewWishList";
     }
}
