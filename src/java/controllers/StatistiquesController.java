package controllers;

import com.google.gson.Gson;
import dao.ActiviteSportiveDao;
import dao.InscriptionSportDao;
import entities.ActiviteSportive;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "StatistiquesController", urlPatterns = {"/StatistiquesController"})
public class StatistiquesController extends HttpServlet {

    private final ActiviteSportiveDao activiteDao = new ActiviteSportiveDao();
    private final InscriptionSportDao inscriptionDao = new InscriptionSportDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<ActiviteSportive> activites = activiteDao.findAll();
        Map<String, Double> statsMap = new LinkedHashMap<>();

        for (ActiviteSportive act : activites) {
            int inscrits = inscriptionDao.countByActivite(act.getId());
            int capacite = act.getCapaciteMax();
            double taux = capacite > 0 ? ((double) inscrits / capacite) * 100 : 0.0;
            statsMap.put(act.getNom(), Math.round(taux * 10.0) / 10.0);
        }

        String json = new Gson().toJson(statsMap);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
