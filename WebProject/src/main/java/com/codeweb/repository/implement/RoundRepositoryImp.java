/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.jobPosting;
import com.codeweb.pojos.round;
import com.codeweb.repository.RoundRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author KHOA
 */
@Repository
@Transactional
public class RoundRepositoryImp implements RoundRepository{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<round> getRounds(String postID, int roundNumber) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<round> query = builder.createQuery(round.class);

        Root<round> root = query.from(round.class);
        
        Join<round, jobPosting> roundWithPost = root.join("jobPoting", JoinType.LEFT);

        Predicate p1 = builder.equal(root.get("roundNumber").as(Integer.class), roundNumber);
        Predicate p2 = builder.like(roundWithPost.get("postId").as(String.class), postID);
        
        query = query.where(builder.and(p1,p2));
        
        Query q = session.createQuery(query);
        return q.getResultList();
    }

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
