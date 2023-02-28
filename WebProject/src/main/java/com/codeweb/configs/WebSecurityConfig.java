/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.configs;

//import com.codeweb.Monitor.MonitorFilter;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.codeweb.handler.CustomAuthenticationSuccessHandler;
import com.codeweb.service.implement.CustomOAuth2UserService;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;

/**
 *
 * @author KHOA
 */
@Configuration
@EnableWebSecurity
@ComponentScan(basePackages = {
    "com.codeweb.repository",
    "com.codeweb.service"
})
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private CustomOAuth2UserService customOAuth2UserService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
                .antMatchers("/", "/home/**", "/post-detail/**", "/oauth2/**","/loginPage", "/LoginDepartment").permitAll()
                .antMatchers("/account","/job/application","/job/viewMyJob","/post-detail/save/**","/post-detail/view","/candidate").hasRole("candidate")
                .anyRequest().authenticated()
                .and()
            .oauth2Login()
                .loginPage("/loginPage")
                .userInfoEndpoint()
                    .userService(customOAuth2UserService)
                    .and()
                .successHandler(new CustomAuthenticationSuccessHandler())
                .failureUrl("/")
                .and()
            .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .and()
            .csrf().disable();
    }
    
    @Bean
    public ClientRegistrationRepository clientRegistrationRepository() {
        List<ClientRegistration> registrations = Arrays.asList(GoogleClientRegistration.candidateClientRegistration(), GoogleClientRegistration.employeeClientRegistration());
        return new InMemoryClientRegistrationRepository(registrations);
    }
    
    @Bean
    public Cloudinary cloudinary() {
        Cloudinary c = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dd9f1tyca",
                "api_key", "148271595886971",
                "api_secret", "Y7Eb9gQZq7mstYAtb28G-GQFBl8",
                "secure", true
        ));

        return c;
    }
}
