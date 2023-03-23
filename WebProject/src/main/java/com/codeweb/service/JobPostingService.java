/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service;

import com.codeweb.pojos.jobPosting;
import java.util.List;
import java.util.Map;

/**
 *
 * @author KHOA
 */
public interface JobPostingService {
    boolean updateJobPosting(jobPosting jobPosting, String action);
    boolean createJobPosting(jobPosting jobPosting);
    void deleteJobPosting(String id);
    jobPosting getPostByID(String id);
    List<jobPosting> getAllJobPosting();
    List<jobPosting> getPostByKeyword(String kw);
    List<jobPosting> getPost(String id);
    List<jobPosting> getAllHotJob();
    Map<String,List<jobPosting>> getPostByStatus();
}
