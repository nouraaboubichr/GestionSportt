/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.InscriptionSport;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import services.InscriptionSportService;

/**
 *
 * @author hp
 */
@WebServlet("/listeInscriptions")
public class ListeInscriptionsController extends HttpServlet {

    private InscriptionSportService inscriptionService;

    @Override
    public void init() throws ServletException {
        inscriptionService = new InscriptionSportService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<InscriptionSport> inscriptions = inscriptionService.getAllInscriptions(); // assure-toi que cette méthode existe
        request.setAttribute("inscriptions", inscriptions);
        request.getRequestDispatcher("/users/listeInscription.jsp").forward(request, response);
    }
}