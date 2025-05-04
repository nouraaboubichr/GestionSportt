/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name = "Coach")
public class Coach extends User {
    private int experience;

    public Coach() {
    }

    public Coach(String nom, String email, String motDePasse, int experience) {
        super(nom, email, motDePasse);
        this.experience = experience;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }
}