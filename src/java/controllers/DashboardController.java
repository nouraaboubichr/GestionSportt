package controllers;

import entities.ActiviteSportive;
import services.ActiviteSportiveService;
import services.InscriptionSportService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/admin/dashboard")
public class DashboardController extends HttpServlet {

    private ActiviteSportiveService activiteService;
    private InscriptionSportService inscriptionService;

    @Override
    public void init() throws ServletException {
        activiteService = new ActiviteSportiveService();
        inscriptionService = new InscriptionSportService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Statistiques par activité
        List<ActiviteSportive> activites = activiteService.getAllActivites();
        Map<String, Long> statsActivites = new HashMap<>();
        Map<String, ActiviteSportive> activitesMap = new HashMap<>();

        for (ActiviteSportive a : activites) {
            long nbInscriptions = inscriptionService.getInscriptionsByActivite(a.getId()).size();
            statsActivites.put(a.getNom(), nbInscriptions);
            activitesMap.put(a.getNom(), a);
        }

        // Stat global
        
        request.setAttribute("nbInscriptions", inscriptionService.getAllInscriptions().size());
        request.setAttribute("nbActivites", activites.size());

        request.setAttribute("statsActivites", statsActivites);
        request.setAttribute("activitesMap", activitesMap);

        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }
    
}
