/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.configs;

import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
import org.springframework.security.oauth2.core.oidc.IdTokenClaimNames;

/**
 *
 * @author KHOA
 */
public class GoogleClientRegistration {

    public static ClientRegistration employeeClientRegistration() {
        return ClientRegistration.withRegistrationId("google-employee")
                .clientId("14093495895-chh4kno5un2kj4l9p5e2qh2a89h7tp3s.apps.googleusercontent.com")
                .clientSecret("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")
                .clientAuthenticationMethod(ClientAuthenticationMethod.POST)
                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
                .redirectUriTemplate("http://localhost:8084/WebProject/login/oauth2/code/google")
                .scope("profile", "email")
                .authorizationUri("https://accounts.google.com/o/oauth2/v2/auth")
                .tokenUri("https://www.googleapis.com/oauth2/v4/token")
                .userInfoUri("https://www.googleapis.com/oauth2/v3/userinfo")
                .userNameAttributeName(IdTokenClaimNames.SUB)
                .jwkSetUri("https://www.googleapis.com/oauth2/v3/certs")
                .clientName("Google")
                .build();
    }
    
    public static ClientRegistration candidateClientRegistration() {
        return ClientRegistration.withRegistrationId("google-candidate")
                .clientId("14093495895-chh4kno5un2kj4l9p5e2qh2a89h7tp3s.apps.googleusercontent.com")
                .clientSecret("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")
                .clientAuthenticationMethod(ClientAuthenticationMethod.POST)
                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
                .redirectUriTemplate("http://localhost:8084/WebProject/login/oauth2/code/google")
                .scope("profile", "email")
                .authorizationUri("https://accounts.google.com/o/oauth2/v2/auth")
                .tokenUri("https://www.googleapis.com/oauth2/v4/token")
                .userInfoUri("https://www.googleapis.com/oauth2/v3/userinfo")
                .userNameAttributeName(IdTokenClaimNames.SUB)
                .jwkSetUri("https://www.googleapis.com/oauth2/v3/certs")
                .clientName("Google")
                .build();
    }
}
