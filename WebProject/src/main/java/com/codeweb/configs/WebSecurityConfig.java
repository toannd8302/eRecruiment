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
import com.codeweb.passwordEncoder.NoOpPasswordEncoder;
import com.codeweb.service.implement.CustomOAuth2UserService;
import com.codeweb.service.implement.CustomUserDetailService;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author KHOA
 */
@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
    "com.codeweb.repository",
    "com.codeweb.service",
    "com.codeweb.handler"
})
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private CustomOAuth2UserService customOAuth2UserService;

    @Autowired
    private CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                    .antMatchers("/", "/home/**", "/post-detail/**", "/oauth2/**", "/loginPage", "/login").permitAll()
                    .antMatchers("/account", "/job/application", "/job/viewMyJob", "/post-detail/save/**", "/post-detail/view", "/candidate").hasRole("CANDIDATE")
                    .antMatchers("/employee","/jobPostings","/jobApps","/schedules").hasRole("EMPLOYEE")
                    .antMatchers("/interviewer").hasRole("INTERVIEWER")
                    .antMatchers("/manager").hasRole("MANAGER")
                    .antMatchers("/department").hasRole("DEPARTMENT")
                    .anyRequest().authenticated()
                .and()
                .formLogin()
//                    .loginPage("/login")
                        .usernameParameter("email")
//                        .passwordParameter("password")
                        .defaultSuccessUrl("/department")
                        .failureUrl("/login?error")
                        .permitAll()
                    .and()
                    .exceptionHandling()
                    .accessDeniedPage("/LoginDepartment?accessDenied")
                .and()
                    .oauth2Login()
                        .loginPage("/loginPage")
                        .userInfoEndpoint()
                        .userService(customOAuth2UserService)
                    .and()
                    .successHandler(customAuthenticationSuccessHandler)
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
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Bean
    public UserDetailsService userDetailsService(){
        return new CustomUserDetailService();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setPasswordEncoder(new NoOpPasswordEncoder());
        authenticationProvider.setUserDetailsService(userDetailsService());
        return authenticationProvider;
    }
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
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
