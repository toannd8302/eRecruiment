/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

/**
 *
 * @author loqua
 */
import com.codeweb.pojos.candidate;
import com.codeweb.pojos.jobPosting;
import com.codeweb.service.CandidateService;
import com.codeweb.service.JobPostingService;
import com.codeweb.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishListServiceImp implements WishListService {

    @Autowired
    private CandidateService candidateService;

    @Autowired
    private JobPostingService jobPostingService;

//    private Set<jobPosting> wishList = new TreeSet<>();
//    //Gioi han WishList
//    private static final int MAX_WISHLIST_SIZE = 5;
//    private int wishListCount = 0;
    public void addToWishList(candidate candidate, jobPosting jobPosting) {
        if (!candidate.getJobPostings().contains(jobPosting)) {
            candidate.getJobPostings().add(jobPosting);
            jobPosting.getCandidates().add(candidate);
            this.candidateService.update(candidate);
        }
    }

    public void removeJobPosting(candidate candidate, jobPosting jobPosting) {
        candidate.getJobPostings().remove(jobPosting);
        jobPosting.getCandidates().remove(candidate);
//        this.candidateService.update(candidate);
        this.jobPostingService.updateJobPosting(jobPosting,"update wishList");
//            this.jobPostingService.updateJobPosting(jobPosting, "update wishList"); 
    }
}
