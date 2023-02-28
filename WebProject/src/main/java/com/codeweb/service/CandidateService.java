/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service;

import com.codeweb.pojos.candidate;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface CandidateService {
    List<candidate> getAll();
    List<candidate> getCandidateById(String id);
    List<candidate> findByEmail(String email);
    boolean addOrUpdate(candidate candidate);
    candidate findCandidate(String id);
}
