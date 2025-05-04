package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.HibernateException;
import util.HibernateUtil;
import java.util.List;

public abstract class AbstractDao<T> implements IDao<T> {
    private final Class<T> entityClass;

    public AbstractDao(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

   @Override
public boolean create(T o) {
    boolean status = executeTransaction(session -> {
        session.save(o);
        System.out.println("Objet sauvegardé: " + o);  // Vérification log
    });
    if (status) {
        System.out.println("Insertion réussie !");
    } else {
        System.out.println("Échec de l'insertion.");
    }
    return status;
}


    @Override
    public boolean delete(T o) {
        return executeTransaction(session -> session.delete(o));
    }

    @Override
    public boolean update(T o) {
        return executeTransaction(session -> session.update(o));
    }

    @Override
    public List<T> findAll() {
        Session session = null;
        Transaction tx = null;
        List<T> list = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            list = session.createQuery("from " + entityClass.getSimpleName()).list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
        } finally {
            if (session != null) session.close();
        }
        return list;
    }

    public T findById(int id) {
        Session session = null;
        Transaction tx = null;
        T entity = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            entity = (T) session.get(entityClass, id);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
        } finally {
            if (session != null) session.close();
        }
        return entity;
    }

    private boolean executeTransaction(HibernateOperation<T> operation) {
        Session session = null;
        Transaction tx = null;
        boolean status = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            operation.execute(session);
            tx.commit();
            status = true;
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
        } finally {
            if (session != null) session.close();
        }
        return status;
    }

    @FunctionalInterface
    private interface HibernateOperation<T> {
        void execute(Session session);
    }
}
