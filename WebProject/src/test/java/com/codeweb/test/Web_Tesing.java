/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.test;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

/**
 *
 * @author toan0
 */
public class Web_Tesing {
    private static WebDriver myBrowser;
    @BeforeAll
    public static void setUpClass(){
        System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
        myBrowser = new ChromeDriver();
        myBrowser.manage().window().maximize();
    }
    
    @Test
    public void checkLogin() throws InterruptedException{
         myBrowser.get("http://localhost:8080/WebProject/");
         Thread.sleep(5000);
    }
    
    @AfterAll
      public static void tearDownClass(){
          myBrowser.quit();
      }
    
}
