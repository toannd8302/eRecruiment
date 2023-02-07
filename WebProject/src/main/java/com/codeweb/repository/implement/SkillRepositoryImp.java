/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.Skill;
import com.codeweb.repository.SkillRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author toan0
 */
@Repository
public class SkillRepositoryImp implements SkillRepository{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    @Transactional
    public List<Skill> getSkills() {
         Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Skill");    
        return q.getResultList();
    }
    
}
