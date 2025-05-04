// LoginController.java
package controllers;

import entities.User;
import services.UserService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginController {
    
    private UserService userService;
    
    public LoginController() {
        userService = new UserService();
    }
    
    /**
     * Authentifie un utilisateur avec son email et mot de passe
     * @param email L'email de l'utilisateur
     * @param motDePasse Le mot de passe de l'utilisateur
     * @return L'utilisateur authentifié ou null si échec
     */
    public User authentifier(String email, String motDePasse) {
        return userService.authenticateUser(email, motDePasse);
    }
    
    /**
     * Connecte un utilisateur et stocke ses informations en session
     * @param user L'utilisateur à connecter
     * @param request La requête HTTP pour accéder à la session
     * @return true si la connexion a réussi, false sinon
     */
    public boolean connecter(User user, HttpServletRequest request) {
        if (user != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("userType", determinerTypeUtilisateur(user));
            return true;
        }
        return false;
    }
    
    /**
     * Déconnecte l'utilisateur en invalidant la session
     * @param request La requête HTTP pour accéder à la session
     */
    public void deconnecter(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
    
    /**
     * Vérifie si un utilisateur est connecté
     * @param request La requête HTTP pour accéder à la session
     * @return true si un utilisateur est connecté, false sinon
     */
    public boolean estConnecte(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && session.getAttribute("user") != null;
    }
    
    /**
     * Détermine le type d'utilisateur (Admin, Coach ou User standard)
     * @param user L'utilisateur dont on veut connaître le type
     * @return Le type d'utilisateur sous forme de chaîne ("admin", "coach" ou "user")
     */
    private String determinerTypeUtilisateur(User user) {
        if (user.getClass().getSimpleName().equals("Admin")) {
            return "admin";
        } else if (user.getClass().getSimpleName().equals("Coach")) {
            return "coach";
        } else {
            return "user";
        }
    }
}