package entities;

import java.io.Serializable;
import java.util.Objects;

public class InscriptionSportId implements Serializable {
    private Long activite; // Corresponds to activite.id
    private Long user;     // Corresponds to user.id
    
    public InscriptionSportId() {}
    
    public InscriptionSportId(Long activite, Long user) {
        this.activite = activite;
        this.user = user;
    }
    
    public Long getActivite() {
        return activite;
    }
    
    public void setActivite(Long activite) {
        this.activite = activite;
    }
    
    public Long getUser() {
        return user;
    }
    
    public void setUser(Long user) {
        this.user = user;
    }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof InscriptionSportId)) return false;
        InscriptionSportId that = (InscriptionSportId) o;
        return Objects.equals(user, that.user) && Objects.equals(activite, that.activite);
    }
    
    @Override
    public int hashCode() {
        return Objects.hash(user, activite);
    }
}