package servlets;

import controllers.CoachController;
import controllers.LoginController;
import entities.Coach;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet qui gère l'administration des coachs (CRUD)
 */
@WebServlet(name = "AdminCoachServlet", urlPatterns = {"/admin/coaches"})
public class AdminCoachServlet extends HttpServlet {

    private CoachController coachController;
    private LoginController loginController;
    
    @Override
    public void init() throws ServletException {
        coachController = new CoachController();
        loginController = new LoginController();
    }
    
    /**
     * Affiche la liste des coachs avec options d'administration
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Vérifier si l'utilisateur est connecté et est un admin
        if (!loginController.estConnecte(request) || 
                !"admin".equals(request.getSession().getAttribute("userType"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        // Gestion des opérations (édition, suppression)
        String action = request.getParameter("action");
        String idParam = request.getParameter("id");
        
        if (action != null && idParam != null) {
            int id = Integer.parseInt(idParam);
            
            if ("edit".equals(action)) {
                // Charger le coach pour l'édition
                Coach coach = coachController.getCoach(id);
                request.setAttribute("coachToEdit", coach);
                
            } else if ("delete".equals(action)) {
                // Supprimer le coach
                coachController.supprimerCoach(id);
                request.getSession().setAttribute("successMessage", "Coach supprimé avec succès");
            }
        }
        
        // Récupérer tous les coachs
        request.setAttribute("coaches", coachController.getTousLesCoachs());
        request.getRequestDispatcher("/WEB-INF/views/admin/coaches.jsp").forward(request, response);
    }

    /**
     * Traite les formulaires d'ajout et de modification des coachs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Vérifier si l'utilisateur est connecté et est un admin
        if (!loginController.estConnecte(request) || 
                !"admin".equals(request.getSession().getAttribute("userType"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        // Récupérer les paramètres du formulaire
        String action = request.getParameter("formAction");
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");
        int experience = Integer.parseInt(request.getParameter("experience"));
        
        boolean success = false;
        String message = "";
        
        if ("create".equals(action)) {
            // Création d'un nouveau coach
            success = coachController.creerCoach(nom, email, motDePasse, experience);
            message = success ? "Coach créé avec succès" : "Erreur lors de la création du coach";
            
        } else if ("update".equals(action)) {
            // Mise à jour d'un coach existant
            int id = Integer.parseInt(request.getParameter("id"));
            success = coachController.mettreAJourCoach(id, nom, email, motDePasse, experience);
            message = success ? "Coach mis à jour avec succès" : "Erreur lors de la mise à jour du coach";
        }
        
        if (success) {
            request.getSession().setAttribute("successMessage", message);
        } else {
            request.getSession().setAttribute("errorMessage", message);
        }
        
        response.sendRedirect(request.getContextPath() + "/admin/coaches");
    }
}