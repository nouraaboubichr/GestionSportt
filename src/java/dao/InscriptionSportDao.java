package dao;

import entities.InscriptionSport;
import entities.InscriptionSportId;
import entities.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
import java.util.List;
import javax.persistence.EntityManager;


public class InscriptionSportDao extends AbstractDao<InscriptionSport> {
    public InscriptionSportDao() {
        super(InscriptionSport.class);
    }
  

    @SuppressWarnings("unchecked")
    public List<InscriptionSport> findByActivite(Long activiteId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List<InscriptionSport> list = null;
        
        try {
            tx = session.beginTransaction();
            // Use createQuery instead of createNamedQuery
            Query query = session.createQuery("from InscriptionSport where activite.id = :activiteId");
            query.setParameter("activiteId", activiteId);
            list = query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return list;
    }
    
    @SuppressWarnings("unchecked")
    public List<InscriptionSport> findByUser(Long userId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List<InscriptionSport> list = null;
        
        try {
            tx = session.beginTransaction();
            // Use createQuery instead of createNamedQuery
            Query query = session.createQuery("from InscriptionSport where user.id = :userId");
            query.setParameter("userId", userId);
            list = query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return list;
    }
    
    public InscriptionSport findById(Long activiteId, Long userId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        InscriptionSport inscription = null;
        
        try {
            tx = session.beginTransaction();
            inscription = (InscriptionSport) session.get(InscriptionSport.class, 
                new InscriptionSportId(activiteId, userId));
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return inscription;
    }
    
    @Override
    public boolean create(InscriptionSport inscription) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        boolean status = false;
        
        try {
            tx = session.beginTransaction();
            session.save(inscription);
            tx.commit();
            status = true;
            System.out.println("Inscription créée avec succès: " + inscription.getUser().getNom() + 
                    " inscrit à " + inscription.getActivite().getNom());
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return status;
    }
    
    @Override
    public boolean update(InscriptionSport inscription) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        boolean status = false;
        
        try {
            tx = session.beginTransaction();
            session.update(inscription);
            tx.commit();
            status = true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return status;
    }
    
    @Override
    public boolean delete(InscriptionSport inscription) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        boolean status = false;
        
        try {
            tx = session.beginTransaction();
            session.delete(inscription);
            tx.commit();
            status = true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return status;
    }
    



    
}