package entities;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ActiviteSportive")
public class ActiviteSportive {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String nom;
    private String description;
    private int capaciteMax;
    
    @OneToMany(mappedBy = "activite", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Set<InscriptionSport> inscriptions = new HashSet<>();
    
    public ActiviteSportive() {}
    
    public ActiviteSportive(String nom, String description, int capaciteMax) {
        this.nom = nom;
        this.description = description;
        this.capaciteMax = capaciteMax;
    }
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getNom() {
        return nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public int getCapaciteMax() {
        return capaciteMax;
    }
    
    public void setCapaciteMax(int capaciteMax) {
        this.capaciteMax = capaciteMax;
    }
    
    public Set<InscriptionSport> getInscriptions() {
        return inscriptions;
    }
    
    public void setInscriptions(Set<InscriptionSport> inscriptions) {
        this.inscriptions = inscriptions;
    }
    
    public void addInscription(InscriptionSport inscription) {
        this.inscriptions.add(inscription);
    }
    
    public void removeInscription(InscriptionSport inscription) {
        this.inscriptions.remove(inscription);
    }

    
}