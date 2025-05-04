// CoachController.java
package controllers;

import entities.Coach;
import services.CoachService;
import services.UserService;
import java.util.List;

public class CoachController {
    
    private CoachService coachService;
    private UserService userService;
    
    public CoachController() {
        coachService = new CoachService();
        userService = new UserService();
    }
    
    /**
     * Crée un nouveau coach
     * @param nom Le nom du coach
     * @param email L'email du coach
     * @param motDePasse Le mot de passe du coach
     * @param experience L'expérience du coach en années
     * @return true si la création a réussi, false sinon
     */
    public boolean creerCoach(String nom, String email, String motDePasse, int experience) {
        // Vérifier si l'email existe déjà
        if (userService.getUserByEmail(email) != null) {
            return false;
        }
        
        Coach coach = new Coach(nom, email, motDePasse, experience);
        return coachService.addCoach(coach);
    }
    
    /**
     * Met à jour les informations d'un coach
     * @param id L'identifiant du coach
     * @param nom Le nouveau nom du coach
     * @param email Le nouvel email du coach
     * @param motDePasse Le nouveau mot de passe du coach
     * @param experience La nouvelle expérience du coach
     * @return true si la mise à jour a réussi, false sinon
     */
    public boolean mettreAJourCoach(int id, String nom, String email, String motDePasse, int experience) {
        Coach coach = coachService.getCoachById(id);
        if (coach != null) {
            coach.setNom(nom);
            coach.setEmail(email);
            coach.setMotDePasse(motDePasse);
            coach.setExperience(experience);
            return coachService.updateCoach(coach);
        }
        return false;
    }
    
    /**
     * Supprime un coach
     * @param id L'identifiant du coach à supprimer
     * @return true si la suppression a réussi, false sinon
     */
    public boolean supprimerCoach(int id) {
        Coach coach = coachService.getCoachById(id);
        if (coach != null) {
            return coachService.deleteCoach(coach);
        }
        return false;
    }
    
    /**
     * Récupère un coach par son identifiant
     * @param id L'identifiant du coach
     * @return Le coach trouvé ou null si non trouvé
     */
    public Coach getCoach(int id) {
        return coachService.getCoachById(id);
    }
    
    /**
     * Récupère tous les coachs
     * @return La liste de tous les coachs
     */
    public List<Coach> getTousLesCoachs() {
        return coachService.getAllCoaches();
    }
    
    /**
     * Vérifie si l'utilisateur est un coach
     * @param userId L'identifiant de l'utilisateur
     * @return true si l'utilisateur est un coach, false sinon
     */
    public boolean estCoach(int userId) {
        Coach coach = coachService.getCoachById(userId);
        return coach != null;
    }
}