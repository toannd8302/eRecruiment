/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.report;
import com.codeweb.repository.ReportRepository;
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
public class ReportRepositoryImp implements ReportRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean add(report report) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(report);
            return true;
        } catch (Exception e) {
            System.err.println("== ADD REPORT ERROR AT ReportRepositoryImp ==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(report report) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.update(report);
            return true;
        } catch (Exception e) {
            System.err.println("== UPDATE REPORT ERROR AT ReportRepositoryImp ==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    @Override
    public List<report> getReportByInterviewerID(String interviewerID) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<report> query = builder.createQuery(report.class);
        Root<report> root = query.from(report.class);
        Predicate p = builder.equal(root.get("employee").get("id").as(String.class), interviewerID);
        query = query.where(p);
        Query q = session.createQuery(query.distinct(true));
        return q.getResultList();
    }

    @Override
    public List<report> getReportByReportID(String reportID) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<report> query = builder.createQuery(report.class);
        Root<report> root = query.from(report.class);
        Predicate p = builder.equal(root.get("reportId").as(String.class), reportID);
        query = query.where(p);
        Query q = session.createQuery(query.distinct(true));
        return q.getResultList();
    }

    @Override
    public List<report> getReportByIDs(String jobAppID, String scheduleID, String interviewerID) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<report> query = builder.createQuery(report.class);
        Root<report> root = query.from(report.class);

        if (jobAppID != null && scheduleID != null && interviewerID != null) {
            Predicate p1 = builder.equal(root.get("jobApplication").get("applicationId").as(String.class), jobAppID);
            Predicate p2 = builder.equal(root.get("schedule").get("scheduleId").as(String.class), scheduleID);
            Predicate p3 = builder.equal(root.get("employee").get("id").as(String.class), interviewerID);
            query = query.where(builder.and(p1,p2,p3));
        }

        Query q = session.createQuery(query.distinct(true));
        return q.getResultList();
    }
}
