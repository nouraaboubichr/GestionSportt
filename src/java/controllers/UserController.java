package controllers;

import entities.User;
import services.UserService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");

        boolean result = false;

        try {
            if ("create".equals(action)) {
                result = creerUtilisateur(nom, email, motDePasse);
            } else if ("update".equals(action)) {
                result = mettreAJourUtilisateur(Long.parseLong(id), nom, email, motDePasse);
            } else if ("delete".equals(action)) {
                result = supprimerUtilisateur(Long.parseLong(id));
            }

            request.setAttribute("message", result ? "Opération réussie !" : "Échec de l'opération.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Erreur système : " + e.getMessage());
        }

        List<User> users = userService.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/users/users.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String id = request.getParameter("id");

        try {
            if ("delete".equals(action) && id != null) {
                Long userId = Long.parseLong(id);
                boolean result = supprimerUtilisateur(userId);
                request.setAttribute("message", result ? "Utilisateur supprimé." : "Erreur suppression utilisateur.");

            } else if ("edit".equals(action) && id != null) {
                Long userId = Long.parseLong(id);
                User user = userService.getUserById(userId);
                if (user != null) {
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("/users/user.jsp").forward(request, response);
                    return;
                } else {
                    request.setAttribute("message", "Utilisateur introuvable.");
                }

            } else if ("showForm".equals(action)) {
                request.getRequestDispatcher("/users/user.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            request.setAttribute("message", "Erreur : " + e.getMessage());
        }

        List<User> users = userService.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/users/users.jsp").forward(request, response);
    }

    private boolean creerUtilisateur(String nom, String email, String motDePasse) {
        User user = new User(nom, email, motDePasse);
        return userService.addUser(user);
    }

    private boolean mettreAJourUtilisateur(Long id, String nom, String email, String motDePasse) {
        User user = userService.getUserById(id);
        if (user != null) {
            user.setNom(nom);
            user.setEmail(email);
            user.setMotDePasse(motDePasse);
            return userService.updateUser(user);
        }
        return false;
    }

    private boolean supprimerUtilisateur(Long id) {
        User user = userService.getUserById(id);
        if (user == null) {
            System.out.println("Utilisateur introuvable avec ID: " + id);
            return false;
        }
        boolean result = userService.deleteUser(id);
        if (!result) {
            System.out.println("Erreur lors de la suppression de l'utilisateur.");
        }
        return result;
    }
}
