// AdminController.java
package controllers;

import entities.Admin;
import services.AdminService;
import services.UserService;
import java.util.List;

public class AdminController {
    
    private AdminService adminService;
    private UserService userService;
    
    public AdminController() {
        adminService = new AdminService();
        userService = new UserService();
    }
    
    /**
     * Crée un nouvel administrateur
     * @param nom Le nom de l'administrateur
     * @param email L'email de l'administrateur
     * @param motDePasse Le mot de passe de l'administrateur
     * @return true si la création a réussi, false sinon
     */
    public boolean creerAdmin(String nom, String email, String motDePasse) {
        // Vérifier si l'email existe déjà
        if (userService.getUserByEmail(email) != null) {
            return false;
        }
        
        Admin admin = new Admin(nom, email, motDePasse);
        return adminService.addAdmin(admin);
    }
    
    /**
     * Met à jour les informations d'un administrateur
     * @param id L'identifiant de l'administrateur
     * @param nom Le nouveau nom de l'administrateur
     * @param email Le nouvel email de l'administrateur
     * @param motDePasse Le nouveau mot de passe de l'administrateur
     * @return true si la mise à jour a réussi, false sinon
     */
    public boolean mettreAJourAdmin(Long id, String nom, String email, String motDePasse) {
        Admin admin = adminService.getAdminById(id);
        if (admin != null) {
            admin.setNom(nom);
            admin.setEmail(email);
            admin.setMotDePasse(motDePasse);
            return adminService.updateAdmin(admin);
        }
        return false;
    }
    
    /**
     * Supprime un administrateur
     * @param id L'identifiant de l'administrateur à supprimer
     * @return true si la suppression a réussi, false sinon
     */
    public boolean supprimerAdmin(Long id) {
        Admin admin = adminService.getAdminById(id);
        if (admin != null) {
            return adminService.deleteAdmin(admin);
        }
        return false;
    }
    
    /**
     * Récupère un administrateur par son identifiant
     * @param id L'identifiant de l'administrateur
     * @return L'administrateur trouvé ou null si non trouvé
     */
    public Admin getAdmin(Long id) {
        return adminService.getAdminById(id);
    }
    
    /**
     * Récupère tous les administrateurs
     * @return La liste de tous les administrateurs
     */
    public List<Admin> getTousLesAdmins() {
        return adminService.getAllAdmins();
    }
    
    /**
     * Vérifie si l'utilisateur est un administrateur
     * @param userId L'identifiant de l'utilisateur
     * @return true si l'utilisateur est un administrateur, false sinon
     */
    public boolean estAdmin(Long userId) {
        Admin admin = adminService.getAdminById(userId);
        return admin != null;
    }
}