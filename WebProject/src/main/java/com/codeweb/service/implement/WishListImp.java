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
import com.codeweb.pojos.jobPosting;
import com.codeweb.service.JobPostingService;
import java.util.Set;
import java.util.TreeSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishListImp {

    @Autowired
    private JobPostingService jobPostingService;
    private Set<jobPosting> wishList = new TreeSet<>();
    //Gioi han WishList
    private static final int MAX_WISHLIST_SIZE = 5;
    private int wishListCount = 0;

    public void addToWishList(jobPosting joP) {
        if (wishListCount < MAX_WISHLIST_SIZE) {
            wishListCount++;
            wishList.add(joP);
        }

    }

    public void removeJobPosting(jobPosting joP) {
        if (wishListCount < MAX_WISHLIST_SIZE) {
            wishListCount++;
            wishList.remove(joP);
        }

    }

    public Set<jobPosting> getWishList() {
        return wishList;
    }
}
