/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.loginModel;

import com.codeweb.pojos.candidate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

/**
 *
 * @author KHOA
 */
public class CustomOAuth2User implements OAuth2User {

    private OAuth2User oauth2User;
    private String registrationId;
    private String role;

    public CustomOAuth2User(OAuth2User oauth2User, String registrationId, String role) {
        this.oauth2User = oauth2User;
        this.registrationId = registrationId;
        this.role = role;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return oauth2User.getAttributes();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>(oauth2User.getAuthorities());
        authorities.add(new SimpleGrantedAuthority(role.toUpperCase()));
        return authorities;
    }

    public String getRegistrationId() {
        return registrationId;
    }

    @Override
    public String getName() {
        return oauth2User.getAttribute("name");
    }
    
    public String getID() {
        return oauth2User.<String>getAttribute("sub");
    }

    public String getEmail() {
        return oauth2User.<String>getAttribute("email");
    }
    
    public String getGivenName() {
        return oauth2User.<String>getAttribute("given_name");
    }
    
    public String getLastName() {
        return oauth2User.<String>getAttribute("family_name");
    }
    
    public String getPicture() {
        return oauth2User.<String>getAttribute("picture");
    }
}
