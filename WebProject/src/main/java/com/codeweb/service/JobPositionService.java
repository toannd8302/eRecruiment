/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.codeweb.service;

import com.codeweb.pojos.jobPosition;

/**
 *
 * @author toan0
 */
public interface JobPositionService {
    jobPosition getJobPositionById(String id);
}
