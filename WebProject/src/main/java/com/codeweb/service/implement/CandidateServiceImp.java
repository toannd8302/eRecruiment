/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.codeweb.constants.Constants;
import com.codeweb.pojos.candidate;
import com.codeweb.repository.CandidateRepository;
import com.codeweb.service.CandidateService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KHOA
 */
@Service
public class CandidateServiceImp implements CandidateService {

    @Autowired
    private CandidateRepository candidateRepository;

    @Override
    public candidate getCandidateByCode(String code) {
        candidate user = new candidate();
        try {
            String accessToken = getToken(code);
            user = getUserInfo(accessToken);
            List<candidate> users = this.candidateRepository.getCandidateById(user.getId());
            if(!users.isEmpty()){
                user = users.get(0);
            }else{
                user.setRole("candidate");
                addOrUpdate(user);
            }
        } catch (Exception e) {
            System.err.println("Error at getCandidateByCode: " + e.getMessage());
        }
        return user;
    }

    @Override
    public boolean addOrUpdate(candidate candidate) {
        return this.candidateRepository.addOrUpdate(candidate);
    }
    
    @Override
    public List<candidate> getAll() {
        return this.candidateRepository.getAll();
    }
    
    
    
    

    public static String getToken(String code) throws IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI)
                        .add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replace("\"", "");
        return accessToken;
    }

    public static candidate getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        candidate user = new Gson().fromJson(response, candidate.class);
        return user;
    }
}
