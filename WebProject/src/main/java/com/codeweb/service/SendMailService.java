/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service;

/**
 *
 * @author KHOA
 */
public interface SendMailService {
    void sendEmail(String to, String subject, String content);
}
