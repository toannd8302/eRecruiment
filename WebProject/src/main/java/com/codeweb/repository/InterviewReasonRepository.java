/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository;

import com.codeweb.pojos.interviewerReasons;

/**
 *
 * @author KHOA
 */
public interface InterviewReasonRepository {
    boolean add(interviewerReasons irs);
    boolean update(interviewerReasons irs);
}
