package services;
import dao.UserDao;
import entities.User;
import java.util.List;
public class UserService {

    private UserDao userDao;

    public UserService() {
        userDao = new UserDao();
    }
    // Ajouter un utilisateur
    public boolean addUser(User user) {
        // Vérifier si l'email existe déjà
        List<User> existingUsers = userDao.findByEmail(user.getEmail());
        if (existingUsers != null && !existingUsers.isEmpty()) {
            return false;  // L'email est déjà utilisé
        }
        return userDao.create(user);  // Créer l'utilisateur
    }

    // Mettre à jour un utilisateur
    public boolean updateUser(User user) {
        return userDao.update(user);
    }
    // Supprimer un utilisateur par ID
    public boolean deleteUser(Long userId) {
    User user = userDao.findById(userId);  // Trouver l'utilisateur par ID
    if (user != null) {
        System.out.println("Utilisateur trouvé : " + user.getNom() + " avec ID : " + userId);
        return userDao.delete(user);  // Supprimer l'utilisateur si trouvé
    } else {
        System.out.println("Utilisateur introuvable avec ID : " + userId);
    }
    return false;
}
    // Récupérer un utilisateur par son ID
    public User getUserById(int id) {
        return userDao.findById(id);
    }
    // Récupérer tous les utilisateurs
    public List<User> getAllUsers() {
        return userDao.findAll();
    }
    // Récupérer un utilisateur par son email
   public User getUserByEmail(String email) {
    List<User> users = userDao.findByEmail(email);
    if (users != null && !users.isEmpty()) {
        return users.get(0);
    }
    return null;
}


    // Authentifier un utilisateur par email et mot de passe
    public User authenticateUser(String email, String motDePasse) {
        List<User> users = userDao.findByEmail(email);
        if (users != null && !users.isEmpty()) {
            User user = users.get(0);
            if (user.getMotDePasse().equals(motDePasse)) {
                return user;  // Authentification réussie
            }
        }
        return null;  // Authentification échouée
    }
    // 👍 Bonne méthode
public boolean deleteUser(int userId) {
    User user = userDao.findById(userId);
    if (user != null) {
        return userDao.delete(user);
    }
    return false;
}

    public User getUserById(Long id) {
       return userDao.findById(id);
    }
    
}