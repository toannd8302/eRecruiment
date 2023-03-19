///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
package com.codeweb.service.implement;

import com.codeweb.service.SendMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author KHOA
 */
@Service
@Transactional
public class SendMailServiceImp implements SendMailService {

    @Autowired
    private JavaMailSender mailSender;
    
    @Override
    public void sendEmail(String to, String subject, String content) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom("techmonkeycompany.recruitment@gmail.com");
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);
        mailSender.send(mailMessage);
    }

}
