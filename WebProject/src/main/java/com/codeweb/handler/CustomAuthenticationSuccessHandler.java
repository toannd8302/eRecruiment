/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.handler;

import com.codeweb.loginModel.CustomOAuth2User;
import com.codeweb.pojos.candidate;
import com.codeweb.pojos.employee;
import com.codeweb.service.CandidateService;
import com.codeweb.service.EmployeeService;
import java.io.IOException;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

/**
 *
 * @author KHOA
 */
@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private CandidateService candidateService;

    @Autowired
    private EmployeeService employeeService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {

        CustomOAuth2User oauthUser = (CustomOAuth2User) authentication.getPrincipal();

        String registrationID = oauthUser.getRegistrationId();
        
        if (registrationID.equals("google-candidate")) {
            candidate candidate = this.candidateService.processOAuthPostLogin(oauthUser);
            HttpSession session = request.getSession();
            session.setAttribute("user", candidate);
            response.sendRedirect(request.getContextPath() + "/candidate");
        } else if (registrationID.equals("google-employee")) {
            employee employee = this.employeeService.processOAuthPostLogin(oauthUser);
            if (employee != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", employee);
                if (employee.getRole().equals("ROLE_EMPLOYEE")) {
                    response.sendRedirect(request.getContextPath() + "/employee");
                } else if (employee.getRole().equals("ROLE_INTERVIEWER")) {
                    response.sendRedirect(request.getContextPath() + "/interviewer");
                } else if (employee.getRole().equals("ROLE_MANAGER")) {
                    response.sendRedirect(request.getContextPath() + "/manager");
                }
            } else {

//                String errorMessage = "Invalid username or password";
//                if (exception instanceof LockedException) {
//                    errorMessage = "Your account has been locked due to too many failed login attempts. Please contact the system administrator.";
//                } else if (exception instanceof DisabledException) {
//                    errorMessage = "Your account has been disabled. Please contact the system administrator.";
//                }
//                RedirectAttributes redirectAttributes = new RedirectAttributesModelMap();
//                redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
//                response.sendRedirect(request.getContextPath() + "/login?error");

                // Invalidate the authentication if user doesn't have ROLE_EMPLOYEE
                SecurityContextHolder.getContext().setAuthentication(null);
                response.sendRedirect(request.getContextPath() + "/loginPage?error=noRoleSupported");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login?error=noRegistration");
        }

//        for (GrantedAuthority authority : authorities) {
//            if (authority.getAuthority().equals("ROLE_INTERVIEWER")) {
//                response.sendRedirect(request.getContextPath() + "/interviewer");
//                return;
//            }
//            else if (authority.getAuthority().equals("ROLE_MANAGER")) {
//                response.sendRedirect(request.getContextPath() + "/manager");
//                return;
//            }
//            else if (authority.getAuthority().equals("ROLE_EMPLOYEE")) {
//                response.sendRedirect(request.getContextPath() + "/hr");
//                return;
//            }
//            else if (authority.getAuthority().equals("ROLE_CANDIDATE")) {
//                response.sendRedirect(request.getContextPath() + "/candidate");
//                return;
//            }
//        }
        // Default redirect URL
    }
}
