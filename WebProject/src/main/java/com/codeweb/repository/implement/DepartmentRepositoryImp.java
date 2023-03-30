/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.department;
import com.codeweb.repository.DepartmentRepository;
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
public class DepartmentRepositoryImp implements DepartmentRepository{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public boolean addDepartment(department department) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(department);
            return true;
        } catch (Exception e) {
            System.err.println("ADDDEPARTMENT ERROR: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<department> getDepartments(String email) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<department> query = builder.createQuery(department.class);
        Root root = query.from(department.class);
        query = query.select(root);
        
        if(!email.isEmpty()){
            Predicate p1 = builder.like(root.get("email").as(String.class), email.trim());
            query = query.where(p1);
        }
        
        Query q = session.createQuery(query);
        return q.getResultList();
    }
    
}
