/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.controllers;

import com.mysql.cj.xdevapi.SessionFactory;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
        Session s = sessionFactory.getObject().openSession();
        Query q = s.createQuery("From person");
        model.addAttribute("content",q.getResultList());
        s.close();
        
        return "index";
    }
}
