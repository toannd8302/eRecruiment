/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.jobApplicationSchedule;
import com.codeweb.repository.JobAppScheduleRepository;
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
public class JobAppScheduleRepositoryImp implements JobAppScheduleRepository{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public boolean add(jobApplicationSchedule jobApplicationSchedule) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(jobApplicationSchedule);
            return true;
        } catch (Exception e) {
            System.err.println("== ADD JOB APPLICATION SCHEDULE ERROR AT JobAppScheduleRepositoryImp ==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<jobApplicationSchedule> getJobAppScheduleByID(String applicationId, String scheduleId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<jobApplicationSchedule> query = builder.createQuery(jobApplicationSchedule.class);
        Root<jobApplicationSchedule> root = query.from(jobApplicationSchedule.class);
        
        if(applicationId != null && scheduleId != null){
            Predicate p1 = builder.equal(root.get("applicationId").as(String.class),applicationId);
            Predicate p2 = builder.equal(root.get("scheduleId").as(String.class),scheduleId);
            query = query.where(builder.and(p1,p2));
        }
        
        Query q = session.createQuery(query.distinct(true));
        return q.getResultList();
    }

    @Override
    public boolean update(jobApplicationSchedule jobApplicationSchedule) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.update(jobApplicationSchedule);
            return true;
        } catch (Exception e) {
            System.err.println("== ADD JOB APPLICATION SCHEDULE ERROR AT JobAppScheduleRepositoryImp ==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
}
