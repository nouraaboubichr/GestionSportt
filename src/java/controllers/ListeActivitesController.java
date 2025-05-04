/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.ActiviteSportive;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.ActiviteSportiveService;

/**
 *
 * @author hp
 */
@WebServlet("/listeActivites")
public class ListeActivitesController extends HttpServlet {
    private ActiviteSportiveService activiteService;

    @Override
    public void init() throws ServletException {
        activiteService = new ActiviteSportiveService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ActiviteSportive> activites = activiteService.getAllActivites();
        request.setAttribute("activites", activites);
        request.getRequestDispatcher("/activites/listeActivites.jsp").forward(request, response);
    }
}

