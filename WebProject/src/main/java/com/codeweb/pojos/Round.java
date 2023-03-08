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
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @author toan0
 */
@Entity
@Table(name = "Rounds")
public class round implements Serializable{
    
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "Round_id", columnDefinition = "NVARCHAR(6)")
    private String roundID;
    
    @Column(name = "Round_number")
    private String roundNumber;
    
    @Column(name = "Content")
    private String content;
    
    @ManyToOne
    @JoinColumn(name = "Post_id")
    private jobPosting jobPoting;

    @OneToMany (mappedBy = "round", fetch = FetchType.EAGER)
    private Set<schedule> schedule;

    public Set<schedule> getSchedule() {
        return schedule;
    }

    public void setSchedule(Set<schedule> schedule) {
        this.schedule = schedule;
    }
    
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
