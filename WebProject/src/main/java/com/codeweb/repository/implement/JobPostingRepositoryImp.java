/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.jobPosition;
import com.codeweb.pojos.jobPosting;
import com.codeweb.pojos.skill;
import com.codeweb.repository.JobPostingRepository;
import java.util.Collection;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.Set;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.ListJoin;

/**
 *
 * @author KHOA
 */
@Repository
@Transactional
public class JobPostingRepositoryImp implements JobPostingRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<jobPosting> getPostByKeyword(String kw) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<jobPosting> query = builder.createQuery(jobPosting.class);
        Root<jobPosting> root = query.from(jobPosting.class);
        Join<jobPosting,jobPosition> position = root.join("jobPosition");
        Join<jobPosition,skill> skill = position.join("skills");

        Predicate p3 = builder.equal(root.get("ApprovedStatus").as(String.class),"Approved");
        query = query.where(p3);
        
        if(!kw.isEmpty() && kw!=null){
            Predicate p1 = builder.like(position.get("jobName").as(String.class), 
                    String.format("%%%s%%", kw));
            Predicate p2 = builder.like(skill.get("skillName").as(String.class), 
                    String.format("%%%s%%", kw));
            query = query.where(builder.or(p1,p2));
        }
        
        Query q = session.createQuery(query.distinct(true));
        return q.getResultList();

//        Query q = session.createQuery("SELECT DISTINCT p FROM jobPosting p JOIN p.jobPosition j JOIN j.skills s"
//                + " WHERE j.jobName LIKE :kw"
//                + " OR s.skillName LIKE :kw");
//        q.setParameter("kw", new String("%" + kw + "%"));
//        return q.getResultList();
    }
    
    
    
    @Override
    public List<jobPosting> getPostById(String id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<jobPosting> query = builder.createQuery(jobPosting.class);
        Root<jobPosting> root = query.from(jobPosting.class);
        query = query.select(root);

        if (!id.isEmpty() && id != null) {
            Predicate p1 = builder.like(root.get("postId").as(String.class),
                    String.format("%%%s%%", id));
            query = query.where(p1);
        }
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<jobPosting> getPostByStatus(String status) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<jobPosting> query = builder.createQuery(jobPosting.class);
        Root<jobPosting> root = query.from(jobPosting.class);
        Predicate p = builder.equal(root.get("ApprovedStatus").as(String.class),status);
        query = query.where(p);
        Query q = session.createQuery(query.distinct(true));
        return q.getResultList();
    }

}
