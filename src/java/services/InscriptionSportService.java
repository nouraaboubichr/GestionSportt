package services;

import dao.ActiviteSportiveDao;
import dao.InscriptionSportDao;
import dao.UserDao;
import entities.ActiviteSportive;
import entities.InscriptionSport;
import entities.User;
import java.time.LocalDate;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class InscriptionSportService {
    private InscriptionSportDao inscriptionDao;
    private ActiviteSportiveDao activiteDao;
    private UserDao userDao;
    
    public InscriptionSportService() {
        inscriptionDao = new InscriptionSportDao();
        activiteDao = new ActiviteSportiveDao();
        userDao = new UserDao();
    }
    
    public boolean inscrireUserToActivite(Long userId, Long activiteId) {
        Session session = null;
        Transaction tx = null;
        boolean success = false;
        
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            
            User user = (User) session.get(User.class, userId);
            ActiviteSportive activite = (ActiviteSportive) session.get(ActiviteSportive.class, activiteId);
            
            if (user == null || activite == null) {
                System.out.println("Utilisateur ou activité introuvable.");
                return false;
            }
            
            // Vérifier si la capacité max est atteinte
            Query query = session.createQuery("select count(*) from InscriptionSport where activite.id = :activiteId");
            query.setParameter("activiteId", activiteId);
            Long count = (Long) query.uniqueResult();
            
            if (count >= activite.getCapaciteMax()) {
                System.out.println("Capacité maximale atteinte pour l'activité.");
                return false;
            }
            
            // Vérifier si l'utilisateur est déjà inscrit
            query = session.createQuery("from InscriptionSport where user.id = :userId and activite.id = :activiteId");
            query.setParameter("userId", userId);
            query.setParameter("activiteId", activiteId);
            InscriptionSport existingInscription = (InscriptionSport) query.uniqueResult();
            
            if (existingInscription != null) {
                System.out.println("L'utilisateur est déjà inscrit à cette activité.");
                return false;
            }
            
            // Créer l'inscription
            InscriptionSport inscription = new InscriptionSport(activite, user, LocalDate.now());
            
            // Ajouter l'inscription aux collections
            if (activite.getInscriptions() != null) {
                activite.getInscriptions().add(inscription);
            }
            
            if (user.getInscriptions() != null) {
                user.getInscriptions().add(inscription);
            }
            
            // Sauvegarder l'inscription
            session.save(inscription);
            
            // Mettre à jour les entités parentes
            session.update(activite);
            session.update(user);
            
            tx.commit();
            success = true;
            System.out.println("Inscription réussie pour " + user.getNom() + " à l'activité " + activite.getNom());
            
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            System.out.println("Erreur lors de l'inscription: " + e.getMessage());
        } finally {
            if (session != null) session.close();
        }
        
        return success;
    }
    
    public boolean annulerInscription(Long userId, Long activiteId) {
        Session session = null;
        Transaction tx = null;
        boolean success = false;
        
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            
            Query query = session.createQuery("from InscriptionSport where user.id = :userId and activite.id = :activiteId");
            query.setParameter("userId", userId);
            query.setParameter("activiteId", activiteId);
            InscriptionSport inscription = (InscriptionSport) query.uniqueResult();
            
            if (inscription == null) {
                System.out.println("Inscription non trouvée.");
                return false;
            }
            
            // Récupérer les entités parentes
            User user = inscription.getUser();
            ActiviteSportive activite = inscription.getActivite();
            
            // Supprimer l'inscription des collections
            if (user.getInscriptions() != null) {
                user.getInscriptions().remove(inscription);
            }
            
            if (activite.getInscriptions() != null) {
                activite.getInscriptions().remove(inscription);
            }
            
            // Supprimer l'inscription
            session.delete(inscription);
            
            // Mettre à jour les entités parentes
            session.update(user);
            session.update(activite);
            
            tx.commit();
            success = true;
            System.out.println("Inscription annulée avec succès.");
            
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            System.out.println("Erreur lors de l'annulation de l'inscription: " + e.getMessage());
        } finally {
            if (session != null) session.close();
        }
        
        return success;
    }
    
    public List<InscriptionSport> getAllInscriptions() {
        return inscriptionDao.findAll();
    }
    
    public List<InscriptionSport> getInscriptionsByActivite(Long activiteId) {
        return inscriptionDao.findByActivite(activiteId);
    }
    
    public List<InscriptionSport> getInscriptionsByUser(Long userId) {
        return inscriptionDao.findByUser(userId);
    }
   


}