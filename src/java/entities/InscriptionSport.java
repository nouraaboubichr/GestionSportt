/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries({
    @NamedQuery(name = "findByActivite", query = "from InscriptionSport where activite.id = :activiteId"),
    @NamedQuery(name = "findByUser", query = "from InscriptionSport where user.id = :userId")
})
@IdClass(InscriptionSportId.class)
@Table(name = "InscriptionSport")
public class InscriptionSport {

    @Id
    @ManyToOne
    @JoinColumn(name = "activite_id")
    private ActiviteSportive activite;

    @Id
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    private LocalDate date;

    public InscriptionSport() {}

    public InscriptionSport(ActiviteSportive activite, User user, LocalDate date) {
        this.activite = activite;
        this.user = user;
        this.date = date;
    }

    public ActiviteSportive getActivite() { 
        return activite; 
    }

    public void setActivite(ActiviteSportive activite) {
        this.activite = activite;
    }

    public User getUser() {
        return user; 
    }

    public void setUser(User user) { 
        this.user = user;
    }

    public LocalDate getDate() {
        return date; 
    }

    public void setDate(LocalDate date) { 
        this.date = date; 
    }
}