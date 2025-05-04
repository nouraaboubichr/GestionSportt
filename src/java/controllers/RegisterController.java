package controllers;

import entities.Admin;
import entities.Coach;
import entities.User;
import services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/users/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");
        String type = request.getParameter("type"); // Peut être "user", "coach" ou "admin"

        if (nom == null || email == null || motDePasse == null || type == null || nom.isEmpty() || email.isEmpty() || motDePasse.isEmpty()) {
            request.setAttribute("message", "Veuillez remplir tous les champs.");
            request.setAttribute("messageType", "danger");
            request.getRequestDispatcher("/users/register.jsp").forward(request, response);
            return;
        }

        User user = null;
        switch (type) {
            case "coach":
                user = new Coach(nom, email, motDePasse, 0); // Expérience initiale = 0
                break;
            case "admin":
                user = new Admin(nom, email, motDePasse);
                break;
            default:
                user = new User(nom, email, motDePasse);
                break;
        }

        boolean success = userService.addUser(user);

        if (success) {
            request.setAttribute("message", "Compte créé avec succès. Veuillez vous connecter.");
            request.setAttribute("messageType", "success");
            request.getRequestDispatcher("/users/login.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Email déjà utilisé. Veuillez en choisir un autre.");
            request.setAttribute("messageType", "danger");
            request.getRequestDispatcher("/users/register.jsp").forward(request, response);
        }
    }
}
