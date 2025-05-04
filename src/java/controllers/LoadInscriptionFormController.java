package controllers;

import entities.ActiviteSportive;
import entities.User;
import services.ActiviteSportiveService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/loadInscriptionForm")
public class LoadInscriptionFormController extends HttpServlet {

    private final ActiviteSportiveService activiteService = new ActiviteSportiveService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Vérifie si l'utilisateur est connecté
        if (user == null) {
            request.setAttribute("error", "Utilisateur non connecté.");
            request.getRequestDispatcher("/users/inscriptionForm.jsp").forward(request, response);
            return;
        }

        List<ActiviteSportive> activites = activiteService.getAllActivites();
        request.setAttribute("activites", activites);
        request.setAttribute("userId", user.getId());

        request.getRequestDispatcher("/users/inscriptionForm.jsp").forward(request, response);
    }
}
