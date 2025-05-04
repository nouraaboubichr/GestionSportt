package controllers;

import entities.User;
import services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/reset-password")
public class ResetPasswordController extends HttpServlet {

    private UserService userService;

    @Override
    public void init() {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        if (email != null && !email.isEmpty()) {
            request.setAttribute("email", email);
            request.getRequestDispatcher("/users/reset-password.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        User user = userService.getUserByEmail(email);

        if (user != null) {
            user.setMotDePasse(newPassword);
            userService.updateUser(user);
            request.setAttribute("message", "Mot de passe mis à jour avec succès.");
            request.setAttribute("messageType", "success");
            request.getRequestDispatcher("/users/login.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Utilisateur introuvable.");
            request.setAttribute("messageType", "danger");
            request.getRequestDispatcher("/users/reset-password.jsp").forward(request, response);
        }
    }
}
