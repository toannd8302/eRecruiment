/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.round;
import com.codeweb.repository.RoundRepository;
import com.codeweb.service.RoundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author toan0
 */
@Service
public class RoundServiceImp implements RoundService {

    @Autowired
    private RoundRepository roundRepository;

    @Override
    public boolean createRound(round round) {
        return this.roundRepository.createRound(round);
    }

}
