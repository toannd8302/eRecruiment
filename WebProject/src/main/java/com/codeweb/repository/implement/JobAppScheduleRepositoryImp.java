/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.jobApplicationSchedule;
import com.codeweb.pojos.schedule;
import com.codeweb.repository.JobAppScheduleRepository;
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
    
}
