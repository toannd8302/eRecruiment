/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.department;
import com.codeweb.pojos.jobPosition;
import com.codeweb.repository.JobPositionRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
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
@Transactional
public class JobPositionRepositoryImp implements JobPositionRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<jobPosition> getAllJobPositions() {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<jobPosition> query = builder.createQuery(jobPosition.class);
        Root root = query.from(jobPosition.class);
        query = query.select(root);

        Query q = session.createQuery(query);
        return q.getResultList();
    }

}
