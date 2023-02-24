/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.jobPosting;
import com.codeweb.service.JobPostingService;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Service;

/**
 *
 * @author toan0
 */
@Service
public class WishList  {
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
            wishList.remove(joP);

    }

    public Set<jobPosting> getWishList() {
        return wishList;
    }

  

}
