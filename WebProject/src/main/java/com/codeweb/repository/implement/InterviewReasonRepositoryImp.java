/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.interviewerReasons;
import com.codeweb.repository.InterviewReasonRepository;
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
public class InterviewReasonRepositoryImp implements InterviewReasonRepository{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public boolean add(interviewerReasons irs) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(irs);
            return true;
        } catch (Exception e) {
            System.err.println("== ADD SCHEDULE ERROR AT ScheduleRepositoryImp ==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(interviewerReasons irs) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.update(irs);
            return true;
        } catch (Exception e) {
            System.err.println("== ADD SCHEDULE ERROR AT ScheduleRepositoryImp ==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
}
