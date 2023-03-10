/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service;

import com.codeweb.pojos.jobPosition;
import java.util.List;

/**
 *
 * @author toan0
 */
public interface JobPositionService {
     List<jobPosition>getAll();
     jobPosition getbyId(String id);
}
