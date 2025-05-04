package dao;
import entities.ActiviteSportive;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class ActiviteSportiveDao extends AbstractDao<ActiviteSportive> {
    public ActiviteSportiveDao() {
        super(ActiviteSportive.class);
    }
    
    // Méthode pour trouver par ID numérique (int)
    @Override
    public ActiviteSportive findById(int id) {
        return findByLongId(Long.valueOf(id));
    }
    
    // Méthode pour trouver par ID Long (le type réel de l'entité)
    public ActiviteSportive findByLongId(Long id) {
        Session session = null;
        Transaction tx = null;
        ActiviteSportive activite = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            System.out.println("ActiviteSportiveDao - Recherche de l'activité avec ID: " + id);
            activite = (ActiviteSportive) session.get(ActiviteSportive.class, id);
            tx.commit();
            System.out.println("ActiviteSportiveDao - Activité trouvée: " + (activite != null ? "OUI" : "NON"));
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            System.err.println("ActiviteSportiveDao - Erreur lors de la recherche de l'activité: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (session != null) {
                try {
                    session.close();
                } catch (HibernateException e) {
                    System.err.println("ActiviteSportiveDao - Erreur lors de la fermeture de la session: " + e.getMessage());
                }
            }
        }
        return activite;
    }
   

}