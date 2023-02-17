/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codeweb.pojos;

/**
 *
 * @author KHOA
 */
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author toan0
 */
@Entity
@Table(name = "Rounds")
public class round implements Serializable{
    @Id
    @Column(name = "Round_id")
    private String roundID;
    
    @Column(name = "Round_number")
    private String roundNumber;
    
    @Column(name = "Content")
    private String content;
    
    @ManyToOne
    @JoinColumn(name = "Post_id")
    private jobPosting jobPoting;

    public String getRoundID() {
        return roundID;
    }

    public void setRoundID(String roundID) {
        this.roundID = roundID;
    }

    public String getRoundNumber() {
        return roundNumber;
    }

    public void setRoundNumber(String roundNumber) {
        this.roundNumber = roundNumber;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public jobPosting getJobPoting() {
        return jobPoting;
    }

    public void setJobPoting(jobPosting jobPoting) {
        this.jobPoting = jobPoting;
    }

    @Override
    public String toString() {
        return "round{" + "roundID=" + roundID + ", roundNumber=" + roundNumber + ", content=" + content + '}';
    }
}
