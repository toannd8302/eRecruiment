/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service;

import com.codeweb.pojos.jobPosting;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface JobPostingService {
    List<jobPosting> getPostByKeyword(String kw);
    jobPosting getPostByID(String id);
    List<jobPosting> getPost(String id);
}
