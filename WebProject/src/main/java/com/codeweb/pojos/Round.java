/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.pojos;

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
public class Round implements Serializable{
    @Id
    @Column(name = "Round_id")
    private String Round_id;
    
    @Column(name = "Round_number")
    private String Round_number;
    
    @Column(name = "[Content]")
    private String Content;
    
    @ManyToOne
    @JoinColumn(name = "Post_id")
    private Jobposting PostId;

    public String getRound_id() {
        return Round_id;
    }

    public void setRound_id(String Round_id) {
        this.Round_id = Round_id;
    }

    public String getRound_number() {
        return Round_number;
    }

    public void setRound_number(String Round_number) {
        this.Round_number = Round_number;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public Jobposting getPostId() {
        return PostId;
    }

    public void setPostId(Jobposting PostId) {
        this.PostId = PostId;
    }

    @Override
    public String toString() {
        return "Round{" + "Round_id=" + Round_id + ", Round_number=" + Round_number + ", Content=" + Content + '}';
    }
    
    
}
