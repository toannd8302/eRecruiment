/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.codeweb.repository;

import com.codeweb.pojos.skill;
import java.util.List;

/**
 *
 * @author toan0
 */
public interface SkillRepository {
    List<skill>getAllSkills();
     skill getSkillById(String id);
}
