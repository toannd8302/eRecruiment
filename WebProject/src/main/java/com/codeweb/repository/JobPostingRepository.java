/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository;

import com.codeweb.pojos.jobPosting;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface JobPostingRepository {
    List<jobPosting> getPostByKeyword(String kw);
    List<jobPosting> getPostById(String id);
    List<jobPosting> getPostByStatus(String status);
}
