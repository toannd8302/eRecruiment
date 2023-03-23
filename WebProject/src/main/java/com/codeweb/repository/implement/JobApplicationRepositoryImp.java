/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.jobApplication;
import com.codeweb.repository.JobApplicationRepository;
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
// Data Access Layer
/*
  - Chịu trách nhiệm cho việc truy cập và xử lý dữ liệu. 
  - Trong tầng này, các đối tượng được tạo ra để kết nối đến cơ sở dữ liệu và thực hiện các thao 
         tác CRUD (Create, Read, Update, Delete) trên các đối tượng dữ liệu       
 */
@Repository
@Transactional
public class JobApplicationRepositoryImp implements JobApplicationRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean add(jobApplication jobApplication) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(jobApplication);
            return true;
        } catch (Exception e) {
            System.err.println("== ADD JOB APPLICATION ERROR ==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    @Override
    public boolean update(jobApplication jobApplication) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.update(jobApplication);
            return true;
        } catch (Exception e) {
            System.err.println("== UPDATE JOB APPLICATION ERROR AT JobApplicationRepositoryImp ==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<jobApplication> jobApplicationList() {

        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<jobApplication> query = builder.createQuery(jobApplication.class);
        Root<jobApplication> root = query.from(jobApplication.class);
       
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<jobApplication> getJobApplicationByStatus(String status) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<jobApplication> query = builder.createQuery(jobApplication.class);
        Root<jobApplication> root = query.from(jobApplication.class);
        Predicate p = builder.equal(root.get("applicationStatus").as(String.class),status);
        query = query.where(p);
        Query q = session.createQuery(query.distinct(true));
        return q.getResultList();
    }
    
    @Override
    public List<jobApplication> getJobApplicationByID(String id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<jobApplication> query = builder.createQuery(jobApplication.class);
        Root<jobApplication> root = query.from(jobApplication.class);
        Predicate p = builder.equal(root.get("applicationId").as(String.class),id);
        query = query.where(p);
        Query q = session.createQuery(query.distinct(true));
        return q.getResultList();
    }
}
