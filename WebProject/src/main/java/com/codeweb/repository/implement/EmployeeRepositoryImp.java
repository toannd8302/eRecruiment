/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.employee;
import com.codeweb.repository.EmployeeRepository;
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
public class EmployeeRepositoryImp implements EmployeeRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addOrUpdate(employee employee) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(employee);
            return true;
        } catch (Exception e) {
            System.err.println("ADD/UPDATE Employee ERROR: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<employee> getAll() {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM employee");
        return q.getResultList();
    }

    @Override
    public List<employee> getEmployeeByEmail(String email) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<employee> query = builder.createQuery(employee.class);
        Root root = query.from(employee.class);
        query = query.select(root);
        Predicate p1 = builder.like(root.get("email").as(String.class), email);
        query = query.where(p1);
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<employee> getEmployeeById(String id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<employee> query = builder.createQuery(employee.class);
        Root root = query.from(employee.class);
        query = query.select(root);
        Predicate p1 = builder.like(root.get("id").as(String.class), id);
        query = query.where(p1);
        Query q = session.createQuery(query);
        return q.getResultList();
    }
}
