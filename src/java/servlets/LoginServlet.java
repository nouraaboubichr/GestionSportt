package servlets;

import controllers.LoginController;
import entities.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login", "/logout", "/users/login"})
public class LoginServlet extends HttpServlet {

    private LoginController loginController;

    @Override
    public void init() throws ServletException {
        loginController = new LoginController();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        if (path.equals("/logout")) {
            // Déconnexion
            loginController.deconnecter(request);
            // Redirige après déconnexion sans ajouter des attributs à la requête
            response.sendRedirect(request.getContextPath() + "/accueil.jsp");
            return;
        }

        // Affichage du formulaire de connexion
        request.getRequestDispatcher("/users/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");

        // Validation des données
        if (email == null || email.trim().isEmpty() || motDePasse == null || motDePasse.trim().isEmpty()) {
            // Si les champs sont vides, on renvoie au formulaire de connexion
            request.setAttribute("message", "Veuillez remplir tous les champs.");
            request.setAttribute("messageType", "danger");
            request.getRequestDispatcher("/users/login.jsp").forward(request, response);
            return;
        }

        // Authentification
        User user = loginController.authentifier(email, motDePasse);

        if (user != null) {
            // Connexion réussie
            loginController.connecter(user, request);

            // Redirection selon le type d'utilisateur
            String userType = (String) request.getSession().getAttribute("userType");
          if ("admin".equals(userType)) {
    response.sendRedirect(request.getContextPath() + "/admin/dashboard");
} else {
    response.sendRedirect(request.getContextPath() + "/users/dashboard.jsp");
}

        } else {
            // Échec de connexion
            request.setAttribute("message", "Email ou mot de passe incorrect.");
            request.setAttribute("messageType", "danger");
            request.getRequestDispatcher("/users/login.jsp").forward(request, response);
        }
    
        
        
    }
}