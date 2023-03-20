/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.service.implement;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.codeweb.pojos.interviewerReasons;
import com.codeweb.repository.InterviewReasonRepository;
import com.codeweb.service.InterviewReasonService;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author KHOA
 */
@Service
public class InterviewReasonServiceImp implements InterviewReasonService {

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private InterviewReasonRepository interviewReasonRepository;

    @Override
    public boolean add(interviewerReasons irs) {
        return this.interviewReasonRepository.add(irs);
    }

    @Override
    public boolean update(interviewerReasons irs) {
        return this.interviewReasonRepository.update(irs);
    }

    @Override
    public boolean acceptSchedule(String scheduleId, String userID) {
        List<interviewerReasons> irsList = this.getIRsByID(scheduleId, userID);
        if (!irsList.isEmpty()) {
            interviewerReasons irs = irsList.get(0);
            irs.setStatus("Approved");
            return this.update(irs);
        }
        return false;
    }

    @Override
    public boolean rejectSchedule(interviewerReasons irs) {
        try {
            //Set String File Path
            Map r = this.cloudinary.uploader().upload(irs.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            irs.setFilepath((String) r.get("secure_url"));
            
            // Get the current date and convert the date to java.sql.Date
            Calendar calendar = Calendar.getInstance();
            java.util.Date currentDate = calendar.getTime();
            java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
            irs.setRejectDate(currentDate);
            
            irs.setStatus("Rejected");
            return this.update(irs);
        } catch (IOException e) {
            System.err.println("==ERROR WHEN REJECT SCHEDULE AT INTERVIEWREASONSERVICE==" + e.getMessage());
        }
        return false;
    }

    @Override
    public List<interviewerReasons> getIRsByID(String scheduleId, String userID) {
        return this.interviewReasonRepository.getIRsByID(scheduleId, userID);
    }
}
