package controllers;

import entities.ActiviteSportive;
import services.ActiviteSportiveService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ActiviteSportiveController")
public class ActiviteSportiveController extends HttpServlet {
    private ActiviteSportiveService activiteService;

    @Override
    public void init() throws ServletException {
        activiteService = new ActiviteSportiveService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String idStr = request.getParameter("id");
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        
        System.out.println("doPost - Action: " + action);
        System.out.println("doPost - ID: " + idStr);
        System.out.println("doPost - Nom: " + nom);
        System.out.println("doPost - Description: " + description);
        
        boolean result = false;
        String message = "";
        
        try {
            // Récupération de la capacité maximale
            int capaciteMaximale = 0;
            if (request.getParameter("capaciteMaximale") != null && !request.getParameter("capaciteMaximale").isEmpty()) {
                capaciteMaximale = Integer.parseInt(request.getParameter("capaciteMaximale"));
                System.out.println("doPost - Capacité maximale: " + capaciteMaximale);
            } else {
                System.out.println("doPost - Aucune capacité maximale spécifiée");
            }
            
            if ("create".equals(action)) {
                result = creerActivite(nom, description, capaciteMaximale);
                message = result ? "Activité créée avec succès!" : "Échec de la création de l'activité.";
            } else if ("update".equals(action) && idStr != null && !idStr.isEmpty()) {
                try {
                    Long activiteId = Long.parseLong(idStr);
                    System.out.println("doPost - Tentative de mise à jour ID: " + activiteId);
                    result = mettreAJourActivite(activiteId, nom, description, capaciteMaximale);
                    message = result ? "Activité mise à jour avec succès!" : "Échec de la mise à jour de l'activité.";
                } catch (NumberFormatException e) {
                    message = "Format d'ID invalide: " + idStr;
                    System.err.println(message);
                    e.printStackTrace();
                }
            } else if ("delete".equals(action) && idStr != null && !idStr.isEmpty()) {
                try {
                    Long activiteId = Long.parseLong(idStr);
                    System.out.println("doPost - Tentative de suppression ID: " + activiteId);
                    result = supprimerActivite(activiteId);
                    message = result ? "Activité supprimée avec succès!" : "Échec de la suppression de l'activité.";
                } catch (NumberFormatException e) {
                    message = "Format d'ID invalide: " + idStr;
                    System.err.println(message);
                    e.printStackTrace();
                }
            } else {
                message = "Action non reconnue ou paramètres manquants.";
                System.err.println("doPost - Action non reconnue: " + action + ", ID: " + idStr);
            }
        } catch (NumberFormatException e) {
            message = "Erreur de format de nombres: " + e.getMessage();
            System.err.println(message);
            e.printStackTrace();
        } catch (Exception e) {
            message = "Erreur système: " + e.getMessage();
            System.err.println("doPost - Exception générale: " + e.getMessage());
            e.printStackTrace();
        }

        System.out.println("doPost - Message final: " + message);
        request.setAttribute("message", message);
        
        // Redirection avec les activités mises à jour
        try {
            List<ActiviteSportive> activites = activiteService.getAllActivites();
            request.setAttribute("activites", activites);
            request.getRequestDispatcher("/activites/activites.jsp").forward(request, response);
        } catch (Exception e) {
            System.err.println("doPost - Erreur lors de la redirection: " + e.getMessage());
            e.printStackTrace();
            // Redirection d'urgence en cas d'erreur
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String idStr = request.getParameter("id");
        
        System.out.println("doGet - Action: " + action);
        System.out.println("doGet - ID: " + idStr);
        
        String message = "";
        boolean redirect = false;

        try {
            if ("delete".equals(action) && idStr != null && !idStr.isEmpty()) {
                try {
                    Long activiteId = Long.parseLong(idStr);
                    System.out.println("doGet - Tentative de suppression ID: " + activiteId);
                    boolean result = supprimerActivite(activiteId);
                    message = result ? "Activité supprimée avec succès." : "Erreur lors de la suppression de l'activité.";
                } catch (NumberFormatException e) {
                    message = "Format d'ID invalide: " + idStr;
                    System.err.println(message);
                    e.printStackTrace();
                }
            } else if ("edit".equals(action) && idStr != null && !idStr.isEmpty()) {
                try {
                    Long activiteId = Long.parseLong(idStr);
                    System.out.println("doGet - Tentative de modification ID: " + activiteId);
                    
                    // Récupérer l'activité
                    ActiviteSportive activite = activiteService.getActiviteById(activiteId.intValue());
                    System.out.println("doGet - Activité récupérée: " + (activite != null ? "OUI" : "NON"));
                    
                    if (activite != null) {
                        System.out.println("doGet - Activité trouvée: " + activite.getNom());
                        request.setAttribute("activite", activite);
                        redirect = true;
                        System.out.println("doGet - Redirection vers le formulaire d'édition");
                        request.getRequestDispatcher("/activites/ajouterActiviteForm.jsp").forward(request, response);
                        return;
                    } else {
                        message = "Activité introuvable pour l'ID: " + activiteId;
                        System.err.println(message);
                    }
                } catch (NumberFormatException e) {
                    message = "Format d'ID invalide: " + idStr;
                    System.err.println(message);
                    e.printStackTrace();
                }
            } else if ("showForm".equals(action)) {
                System.out.println("doGet - Redirection vers formulaire d'ajout");
                redirect = true;
                request.getRequestDispatcher("/activites/ajouterActiviteForm.jsp").forward(request, response);
                return;
            } else {
                System.out.println("doGet - Affichage de la liste des activités");
            }
        } catch (Exception e) {
            message = "Erreur: " + e.getMessage();
            System.err.println("doGet - Exception générale: " + e.getMessage());
            e.printStackTrace();
        }

        if (!message.isEmpty()) {
            System.out.println("doGet - Message final: " + message);
            request.setAttribute("message", message);
        }
        
        if (!redirect) {
            try {
                List<ActiviteSportive> activites = activiteService.getAllActivites();
                request.setAttribute("activites", activites);
                System.out.println("doGet - Affichage de " + (activites != null ? activites.size() : 0) + " activités");
                request.getRequestDispatcher("/activites/activites.jsp").forward(request, response);
            } catch (Exception e) {
                System.err.println("doGet - Erreur lors de la redirection: " + e.getMessage());
                e.printStackTrace();
                // Redirection d'urgence en cas d'erreur
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        }
    }

    private boolean creerActivite(String nom, String description, int capaciteMaximale) {
        System.out.println("Création d'une activité: " + nom);
        return activiteService.addActivite(nom, description, capaciteMaximale);
    }

    private boolean mettreAJourActivite(Long id, String nom, String description, int capaciteMaximale) {
        System.out.println("Mise à jour d'une activité ID: " + id + ", Nom: " + nom);
        ActiviteSportive activite = activiteService.getActiviteById(id.intValue());
        if (activite != null) {
            System.out.println("Activité trouvée pour mise à jour");
            activite.setNom(nom);
            activite.setDescription(description);
            activite.setCapaciteMax(capaciteMaximale);
            return activiteService.updateActivite(activite);
        } else {
            System.err.println("Activité non trouvée pour ID: " + id);
            return false;
        }
    }

    private boolean supprimerActivite(Long id) {
        System.out.println("Suppression d'une activité ID: " + id);
        ActiviteSportive activite = activiteService.getActiviteById(id.intValue());
        if (activite != null) {
            System.out.println("Activité trouvée pour suppression");
            return activiteService.deleteActivite(id.intValue());
        } else {
            System.err.println("Activité non trouvée pour ID: " + id);
            return false;
        }
    }
}