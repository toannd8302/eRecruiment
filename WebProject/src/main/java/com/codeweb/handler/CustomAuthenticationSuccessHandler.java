/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.handler;

import java.io.IOException;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

/**
 *
 * @author KHOA
 */
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        
        for (GrantedAuthority authority : authorities) {
            if (authority.getAuthority().equals("ROLE_INTERVIEWER")) {
                response.sendRedirect(request.getContextPath() + "/interviewer");
                return;
            }
            else if (authority.getAuthority().equals("ROLE_MANAGER")) {
                response.sendRedirect(request.getContextPath() + "/manager");
                return;
            }
            else if (authority.getAuthority().equals("ROLE_EMPLOYEE")) {
                response.sendRedirect(request.getContextPath() + "/hr");
                return;
            }
            else if (authority.getAuthority().equals("ROLE_CANDIDATE")) {
                response.sendRedirect(request.getContextPath() + "/candidate");
                return;
            }
        }
        
        // Default redirect URL
        response.sendRedirect(request.getContextPath() + "/");
    }
}
