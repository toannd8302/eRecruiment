/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.codeweb.pojos;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 *
 * @author toan0
 */
@Entity
@Table(name = "Skills")
public class Skill implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Skill_id")
    private int SkillId;
    private String SKillName;
    
    @ManyToMany(fetch = FetchType.LAZY)//mac dinh la LAZY
    @JoinTable(
            name = "Job_Positions_Skills",
            joinColumns = { @JoinColumn(name = "Skill_id") },
            inverseJoinColumns = { @JoinColumn(name = "Job_id") }
    )
    private Set<JobPosition> JobPositions;

    public int getSkillId() {
        return SkillId;
    }

    public void setSkillId(int SkillId) {
        this.SkillId = SkillId;
    }

    public String getSKillName() {
        return SKillName;
    }

    public void setSKillName(String SKillName) {
        this.SKillName = SKillName;
    }

    public Set<JobPosition> getJobPositions() {
        return JobPositions;
    }

    public void setJobPositions(Set<JobPosition> JobPositions) {
        this.JobPositions = JobPositions;
    }
    
}
