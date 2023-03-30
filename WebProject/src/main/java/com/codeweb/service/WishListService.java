/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service;

import com.codeweb.pojos.candidate;
import com.codeweb.pojos.jobPosting;
import java.util.Set;

/**
 *
 * @author KHOA
 */
public interface WishListService {
    void addToWishList(candidate candiate, jobPosting joP);
    void removeJobPosting(candidate candiate, jobPosting joP);
}
