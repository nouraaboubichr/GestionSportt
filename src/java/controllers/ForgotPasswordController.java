package controllers;


import entities.User;
import services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import services.EmailService;

@WebServlet(name = "ForgotPasswordController", urlPatterns = {"/forgot-password"})
public class ForgotPasswordController extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/users/forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        User user = userService.getUserByEmail(email);

        if (user != null) {
            String resetUrl = request.getRequestURL().toString().replace("forgot-password", "reset-password") + "?email=" + email;
EmailService emailService = new EmailService();

boolean emailSent = emailService.envoyerLienReset(email, resetUrl);

if (emailSent) {
    request.setAttribute("message", "Un lien de réinitialisation a été envoyé à : " + email);
    request.setAttribute("messageType", "success");
} else {
    request.setAttribute("message", "Erreur lors de l'envoi de l'email.");
    request.setAttribute("messageType", "danger");
}

            request.setAttribute("messageType", "success");
        } else {
            request.setAttribute("message", "Aucun compte trouvé avec cet email.");
            request.setAttribute("messageType", "danger");
        }

        request.getRequestDispatcher("/users/forgot-password.jsp").forward(request, response);
    }
} 
