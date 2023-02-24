/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.configs;

import java.util.Properties;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

/**
 *
 * @author KHOA
 */
@Configuration
public class HibernateConfig {

    @Autowired
    @Bean
    public LocalSessionFactoryBean getSessionFactory() {
        LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
        factory.setPackagesToScan("com.codeweb.pojos");

        factory.setDataSource(dataSource());
        factory.setHibernateProperties(hibernateProperties());

        return factory;
    }

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource d = new DriverManagerDataSource();
        d.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        d.setUrl("jdbc:sqlserver://localhost:1433;databaseName=HRManagement");
        d.setUsername("sa");
        d.setPassword("12345");
        return d;
    }

    public Properties hibernateProperties() {
        Properties pros = new Properties();
        pros.setProperty(org.hibernate.cfg.Environment.SHOW_SQL, "true");
        pros.setProperty(org.hibernate.cfg.Environment.DIALECT, "org.hibernate.dialect.SQLServerDialect");
        return pros;
    }

    @Bean
    public HibernateTransactionManager transactionManager() {
        HibernateTransactionManager h = new HibernateTransactionManager();

        h.setSessionFactory(getSessionFactory().getObject());

        return h;
    }
}
