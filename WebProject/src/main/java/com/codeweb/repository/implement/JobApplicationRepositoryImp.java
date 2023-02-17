/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.jobApplication;
import com.codeweb.repository.JobApplicationRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Criteria;
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
public class JobApplicationRepositoryImp implements JobApplicationRepository {

    @Autowired
    LocalSessionFactoryBean sessionFactory;

    //Find ALL JOBAPPLICATION
    @Override
    public List<jobApplication> viewAllJobApplication() {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<jobApplication> query = builder.createQuery(jobApplication.class);
        Root root = query.from(jobApplication.class);
        query = query.select(root);

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    //Find by JobApplicationID
    @Override
    public List<jobApplication> findJobApplicationById(String id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<jobApplication> query = builder.createQuery(jobApplication.class);
        Root root = query.from(jobApplication.class);

        if (!id.isEmpty() && id != null) {
            Predicate p = builder.like(root.get("applicationId").as(String.class), 
                    String.format("%%%s%%", id));
            query = query.where(p);
        }
        Query q = session.createQuery(query);
        return q.getResultList();
    }
    @Override
    public int editJobApplication(String id){
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaUpdate<jobApplication> update =  builder.createCriteriaUpdate(jobApplication.class);
        Root<jobApplication> root = update.from(jobApplication.class);
        
        update.set(root.get("cv"), "CV");
        
        update.where(builder.equal(root.get("applicationId").as(String.class), 
                String.format("%%%s%%", id)));
        
        int q = session.createQuery(update).executeUpdate();
        return q;
    }
    

}
