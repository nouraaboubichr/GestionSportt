// AdminDao.java
package dao;

import entities.Admin;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author hp
 */
public class AdminDao extends AbstractDao<Admin> {
    
    public AdminDao() {
        super(Admin.class);
    }
    
    public List<Admin> findByEmail(String email) {
        Session session = null;
        Transaction tx = null;
        List<Admin> admins = null;
        
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            
            // Requête HQL pour récupérer les admins par email
            String query = "from Admin a where a.email = :email";
            admins = session.createQuery(query)
                    .setParameter("email", email)
                    .list();
            
            tx.commit();
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return admins;
    }
    
    @Override
    public Admin findById(int id) {
        return findById(Long.valueOf(id));
    }
    
    public Admin findById(Long id) {
        Session session = null;
        Transaction tx = null;
        Admin admin = null;
        
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            admin = (Admin) session.get(Admin.class, id);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
        } finally {
            if (session != null) session.close();
        }
        
        return admin;
    }
}