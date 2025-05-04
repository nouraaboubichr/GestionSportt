package dao;

import entities.User;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class UserDao extends AbstractDao<User> {

    public UserDao() {
        super(User.class);
    }

    // Recherche d'un utilisateur par email
   public List<User> findByEmail(String email) {
    Session session = null;
    Transaction tx = null;
    List<User> users = null;
    try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        users = session.getNamedQuery("User.findByEmail")
                       .setParameter("email", email.toLowerCase())
                       .list();
        tx.commit();
    } catch (HibernateException ex) {
        if (tx != null) tx.rollback();
        ex.printStackTrace();
    } finally {
        if (session != null) session.close();
    }
    return users;
}


    // Recherche d'un utilisateur par ID
   public User findById(Long userId) {
    Session session = null;
    User user = null;
    try {
        session = HibernateUtil.getSessionFactory().openSession();
        user = (User) session.get(User.class, userId);
    } catch (HibernateException ex) {
        ex.printStackTrace();  // Affichage de l'exception
    } finally {
        if (session != null) {
            session.close();
        }
    }
    return user;
}


    // Suppression d'un utilisateur
    public boolean delete(User user) {
    Session session = null;
    Transaction tx = null;
    try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();

        User mergedUser = (User) session.merge(user);  // Corrige le problème d'objet detached
        session.delete(mergedUser);  // Maintenant suppression safe

        tx.commit();
        System.out.println("Utilisateur supprimé avec succès : " + mergedUser.getNom());
        return true;
    } catch (HibernateException ex) {
        if (tx != null) {
            tx.rollback();
            System.out.println("Rollback effectué après erreur.");
        }
        ex.printStackTrace();
        return false;
    } finally {
        if (session != null) {
            session.close();
        }
    }
}




    // Méthode de création d'un utilisateur
    public boolean create(User user) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.save(user);  // Sauvegarder l'utilisateur
            tx.commit();
            return true;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            ex.printStackTrace();  // Affichage de l'exception
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Méthode de mise à jour d'un utilisateur
    public boolean update(User user) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.update(user);  // Mettre à jour l'utilisateur
            tx.commit();
            return true;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            ex.printStackTrace();  // Affichage de l'exception
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

}