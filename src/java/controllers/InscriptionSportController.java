package controllers;

import entities.ActiviteSportive;
import entities.InscriptionSport;
import entities.User;
import services.ActiviteSportiveService;
import services.InscriptionSportService;
import services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/InscriptionSportController")
public class InscriptionSportController extends HttpServlet {

    private InscriptionSportService inscriptionService;
    private ActiviteSportiveService activiteService;
    private UserService userService;

    @Override
    public void init() {
        inscriptionService = new InscriptionSportService();
        activiteService = new ActiviteSportiveService();
        userService = new UserService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String userIdStr = request.getParameter("userId");
        String activiteIdStr = request.getParameter("activiteId");

        String message = "";

        try {
            Long userId = Long.parseLong(userIdStr);
            Long activiteId = Long.parseLong(activiteIdStr);

            if ("create".equals(action)) {
                boolean result = inscriptionService.inscrireUserToActivite(userId, activiteId);
                message = result ? "Inscription réussie." : "Échec de l'inscription.";
            }

            else if ("delete".equals(action)) {
                boolean result = inscriptionService.annulerInscription(userId, activiteId);
                message = result ? "Inscription annulée." : "Échec de l'annulation.";
            }

            else if ("update".equals(action)) {
                String oldActiviteIdStr = request.getParameter("oldActiviteId");

                if (oldActiviteIdStr == null || oldActiviteIdStr.isEmpty()) {
                    message = "Ancienne activité non spécifiée.";
                } else {
                    Long oldActiviteId = Long.parseLong(oldActiviteIdStr);

                    boolean annulation = inscriptionService.annulerInscription(userId, oldActiviteId);

                    if (annulation) {
                        boolean nouvelleInscription = inscriptionService.inscrireUserToActivite(userId, activiteId);
                        message = nouvelleInscription ? "Inscription modifiée avec succès."
                                                      : "Erreur lors de la nouvelle inscription.";
                    } else {
                        message = "Impossible d'annuler l'ancienne inscription.";
                    }
                }
            }

            else {
                message = "Action inconnue.";
            }
        } catch (Exception e) {
            message = "Erreur : " + e.getMessage();
            e.printStackTrace();
        }

        request.setAttribute("message", message);
        afficherInscriptionsUtilisateur(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String userIdStr = request.getParameter("userId");
        String message = "";

        try {
            if ("showForm".equals(action)) {
                Long userId = Long.parseLong(userIdStr);
                List<ActiviteSportive> activites = activiteService.getAllActivites();

                request.setAttribute("activites", activites);
                request.setAttribute("userId", userId);
                request.getRequestDispatcher("/users/inscriptionForm.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            message = "Erreur : " + e.getMessage();
            e.printStackTrace();
        }

        request.setAttribute("message", message);
        afficherInscriptionsUtilisateur(request, response);
    }

    private void afficherInscriptionsUtilisateur(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            List<InscriptionSport> inscriptions = inscriptionService.getInscriptionsByUser(user.getId());
            request.setAttribute("inscriptions", inscriptions);
        }

        request.getRequestDispatcher("/users/mesInscriptions.jsp").forward(request, response);
    }
}
