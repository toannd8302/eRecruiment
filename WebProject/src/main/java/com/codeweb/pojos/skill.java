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
public class skill implements Serializable{
    @Id
    @Column(name = "Skill_id")
    private int skillId;
    
    @Column(name = "SKillName")
    private String skillName;
    
    @ManyToMany
    @JoinTable(
            name = "Job_Positions_Skills",
            joinColumns = { @JoinColumn(name = "Skill_id") },
            inverseJoinColumns = { @JoinColumn(name = "Job_id") }
    )
    private Set<jobPosition> jobPositions;
    
    @ManyToMany
    @JoinTable(
            name = "Candidate_Skills",
            joinColumns = { @JoinColumn(name = "Skill_id") },
            inverseJoinColumns = { @JoinColumn(name = "Candidate_id") }
    )
    private Set<candidate> candidates;

    
    public Set<candidate> getCandidates() {
        return candidates;
    }

    public void setCandidates(Set<candidate> candidates) {
        this.candidates = candidates;
    }
    
    public int getSkillId() {
        return skillId;
    }

    public void setSkillId(int skillId) {
        this.skillId = skillId;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public Set<jobPosition> getJobPositions() {
        return jobPositions;
    }

    public void setJobPositions(Set<jobPosition> jobPositions) {
        this.jobPositions = jobPositions;
    }

    @Override
    public String toString() {
        return "skill{" + "skillId=" + skillId + ", skillName=" + skillName + '}';
    }
    
    
}
