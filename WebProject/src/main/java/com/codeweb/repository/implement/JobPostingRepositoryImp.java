/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.Jobposting;
import com.codeweb.repository.JobPostingRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

/**
 *
 * @author toan0
 */
@Repository
public class JobPostingRepositoryImp implements JobPostingRepository{
@Autowired
private LocalSessionFactoryBean session;
    @Override
    public List<Jobposting> getJobpostings() {
        Session s = session.getObject().getCurrentSession();
        String hql = "FROM Jobposting ";
        Query q = s.createQuery(hql);
        return q.getResultList();
    }
    
}
