/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.jobPosition;
import com.codeweb.pojos.skill;
import com.codeweb.repository.SkillRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
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
public class SkillRepositoryImp implements SkillRepository{

     @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<skill> getAllSkills() {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<skill> query = builder.createQuery(skill.class);
        Root root = query.from(skill.class);
        query = query.select(root);

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public skill getSkillById(String id) {
         Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<skill> query = cb.createQuery(skill.class);
        Root<skill> root = query.from(skill.class);
        query.select(root).where(cb.equal(root.get("skillId"), id));
        TypedQuery<skill> typedQuery = session.createQuery(query);
        return typedQuery.getSingleResult();
    }
    
}
