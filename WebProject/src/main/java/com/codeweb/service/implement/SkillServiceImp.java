/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.service.implement;

import com.codeweb.pojos.skill;
import com.codeweb.repository.SkillRepository;
import com.codeweb.service.SkillService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author toan0
 */
@Service
public class SkillServiceImp implements SkillService {
    
    @Autowired
    private SkillRepository skillRepository;
    
    @Override
    public List<skill> getAllSkills() {
        return this.skillRepository.getAllSkills();        
    }
    
    @Override
    public skill getSkillById(String id) {
        return this.skillRepository.getSkillById(id);
    }
    
}
