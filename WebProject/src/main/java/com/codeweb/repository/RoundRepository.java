/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository;

import com.codeweb.pojos.round;
import java.util.List;

/**
 *
 * @author KHOA
 */
public interface RoundRepository {
    List<round> getRounds(String postID, int roundNumber);
    boolean createRound(round round); 
}
