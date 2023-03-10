/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.round;
import com.codeweb.repository.RoundRepository;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

/**
 *
 * @author toan0
 */
@Repository
@Transactional
public class RoundRepositoryImp implements RoundRepository{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public boolean createRound(round round) {
        try {
            Session session = sessionFactory.getObject().getCurrentSession();
            session.save(round);
            return true;
        } catch (Exception e) {
        }
        return false;
    }
    
}
