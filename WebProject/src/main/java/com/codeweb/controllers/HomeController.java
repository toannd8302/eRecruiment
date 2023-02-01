/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.codeweb.pojos.person;
import com.mysql.cj.xdevapi.SessionFactory;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author KHOA
 */

@Controller
public class HomeController {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @RequestMapping("/")
    public String index(Model model){
        String name ="";
        model.addAttribute("name", name);
        return "index";
    }
    
    @RequestMapping(path="/search", method = RequestMethod.POST)
    public String hello(Model model, @ModelAttribute(value = "name") String name){
        Session s = sessionFactory.getObject().openSession();
        
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<person> query = builder.createQuery(person.class);
        Root root = query.from(person.class);
        query = query.select(root);
        
        Predicate p1 = builder.like(root.get("fullName").as(String.class), new String("%"+name+"%"));
        query.where(builder.or(p1));
        
        Query q = s.createQuery(query);
        model.addAttribute("content",q.getResultList());
        s.close();
//          model.addAttribute("MESSAGE",name);
        return "search";
    }
}
