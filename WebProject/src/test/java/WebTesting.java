
import org.junit.jupiter.api.AfterAll;
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author toan0
 */
public class WebTesting {
     private static WebDriver myBrowser;

    @Test
    //Chạy 1 lần duy nhất trước tất cả các @Test
    //Khởi động các giá trị sẽ dùng trong @Test
    public static void setUpClass() {
        System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
        myBrowser = new ChromeDriver();
        myBrowser.get("http://localhost:8080/WebProject/");
        
        myBrowser.manage().window().maximize();
    }
    
        
}
