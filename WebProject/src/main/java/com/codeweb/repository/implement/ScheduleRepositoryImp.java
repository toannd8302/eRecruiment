/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.repository.implement;

import com.codeweb.pojos.interviewerReasons;
import com.codeweb.pojos.jobApplicationSchedule;
import com.codeweb.pojos.jobPosting;
import com.codeweb.pojos.round;
import com.codeweb.pojos.schedule;
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
import com.codeweb.repository.ScheduleRepository;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;

/**
 *
 * @author KHOA
 */
@Repository
@Transactional
public class ScheduleRepositoryImp implements ScheduleRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean add(schedule schedule) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(schedule);
            return true;
        } catch (Exception e) {
            System.err.println("== ADD SCHEDULE ERROR AT ScheduleRepositoryImp ==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(schedule schedule) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.update(schedule);
            return true;
        } catch (Exception e) {
            System.err.println("== ADD SCHEDULE ERROR AT ScheduleRepositoryImp ==" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<schedule> getScheduleByStatusAndID(String interviewerID, String scheduleStatus, String interviewScheduleStatus) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<schedule> query = builder.createQuery(schedule.class);
        Root<schedule> root = query.from(schedule.class);
        Join<schedule, interviewerReasons> interviewReasonJoin = root.join("iRS", JoinType.LEFT);

        if (interviewerID != null && interviewerID != null && interviewScheduleStatus != null) {
            Predicate p1 = builder.equal(interviewReasonJoin.get("employeeId").as(String.class), interviewerID);
            Predicate p2 = builder.equal(root.get("status").as(String.class), scheduleStatus);
            Predicate p3 = builder.equal(interviewReasonJoin.get("status").as(String.class), interviewScheduleStatus);
            query = query.where(builder.and(p1,p2,p3));
        }
        if (interviewerID != null && interviewerID != null && interviewScheduleStatus == null) {
            Predicate p1 = builder.equal(interviewReasonJoin.get("employeeId").as(String.class), interviewerID);
            Predicate p2 = builder.equal(root.get("status").as(String.class), scheduleStatus);
            query = query.where(builder.and(p1,p2));
        }

        Query q = session.createQuery(query.distinct(true));
        return q.getResultList();
    }

    @Override
    public List<schedule> getScheduleByID(String scheduleID) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<schedule> query = builder.createQuery(schedule.class);
        Root<schedule> root = query.from(schedule.class);

        if (!scheduleID.isEmpty() && scheduleID != null) {
            Predicate p = builder.like(root.get("scheduleId").as(String.class), scheduleID);
            query = query.where(p);
        }
        Query q = session.createQuery(query.distinct(true));
        return q.getResultList();
    }

    @Override
    public List<Object[]> getScheduleByStatus(String status) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root<schedule> root = query.from(schedule.class);
        Join<schedule, jobApplicationSchedule> jobApplicationJoin = root.join("jAS", JoinType.LEFT);
        Join<schedule, interviewerReasons> interviewerJoin = root.join("iRS", JoinType.LEFT);

        Predicate p = builder.equal(root.get("status").as(String.class), status);
        query = query.where(p);

        query.multiselect(
                root,
                builder.countDistinct(jobApplicationJoin.get("applicationId")),
                builder.countDistinct(interviewerJoin.get("employeeId"))
        ).groupBy(root.get("location"), root.get("scheduleId"),
                root.get("scheduleDate"), root.get("scheduleTime"),
                root.get("typeOfInterview"), root.get("status"),
                root.get("round"));

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<schedule> getSuitableSchedule(String postID, int roundNumber) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<schedule> query = builder.createQuery(schedule.class);

        Root<schedule> root = query.from(schedule.class);
        Join<schedule, round> roundSchedule = root.join("round", JoinType.LEFT);
        Join<round, jobPosting> roundJobPosting = roundSchedule.join("jobPoting", JoinType.LEFT);

        Predicate p1 = builder.equal(roundSchedule.get("roundNumber").as(Integer.class), roundNumber);
        Predicate p2 = builder.like(roundJobPosting.get("postId").as(String.class), postID);
        query = query.where(builder.and(p1, p2));

        Query q = session.createQuery(query);
        return q.getResultList();
    }
}
