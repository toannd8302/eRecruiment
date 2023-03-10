/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository;

import com.codeweb.pojos.candidate;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface CandidateRepository {
    boolean addOrUpdate(candidate candidate);
    List<candidate> getAll();
    
    List<candidate> getCandidateByEmail(String email);
    
    List<candidate> getCandidateById(String id);
}
