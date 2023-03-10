/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.candidate;
import com.codeweb.repository.CandidateRepository;
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

/**
 *
 * @author KHOA
 */
@Repository
@Transactional
public class CandidateRepositoryImp implements CandidateRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addOrUpdate(candidate candidate) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(candidate);
            return true;
        } catch (Exception e) {
            System.err.println("ADD/UPDATE Candidate ERROR: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<candidate> getAll() {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM candidate");
        return q.getResultList();
    }

    @Override
    public List<candidate> getCandidateById(String id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<candidate> query = builder.createQuery(candidate.class);
        Root root = query.from(candidate.class);
        query = query.select(root);

        if (!id.isEmpty()) {
            Predicate p1 = builder.like(root.get("id").as(String.class), id.trim());
            query = query.where(p1);
        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<candidate> getCandidateByEmail(String email) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<candidate> query = builder.createQuery(candidate.class);
        Root root = query.from(candidate.class);
        query = query.select(root);

        if (!email.isEmpty()) {
            Predicate p1 = builder.like(root.get("email").as(String.class), email.trim());
            query = query.where(p1);
        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

}
