package controllers;

import com.google.gson.Gson;
import dao.ActiviteSportiveDao;
import dao.InscriptionSportDao;
import entities.ActiviteSportive;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet(name = "StatistiquesController", urlPatterns = {"/StatistiquesController"})
public class StatistiquesController extends HttpServlet {

    private final ActiviteSportiveDao activiteDao = new ActiviteSportiveDao();
    private final InscriptionSportDao inscriptionDao = new InscriptionSportDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<ActiviteSportive> activites = activiteDao.findAll();
        Map<String, Double> statsMap = new LinkedHashMap<>();

        for (ActiviteSportive act : activites) {
            int inscrits = inscriptionDao.countByActivite(act.getId());
            int capacite = act.getCapaciteMax();

            double taux = capacite > 0 ? ((double) inscrits / capacite) * 100 : 0.0;
            statsMap.put(act.getNom(), Math.round(taux * 10.0) / 10.0); // pourcentages arrondis à 1 décimale
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.print(new Gson().toJson(statsMap));
        out.flush();
    }
}
