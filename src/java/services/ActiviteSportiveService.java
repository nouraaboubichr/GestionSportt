package services;
import dao.ActiviteSportiveDao;
import entities.ActiviteSportive;
import java.util.List;

public class ActiviteSportiveService {
    
    private ActiviteSportiveDao activiteDao;
    
    public ActiviteSportiveService() {
        activiteDao = new ActiviteSportiveDao();
    }
    
    public boolean addActivite(String nom, String description, int capaciteMaximale) {
        ActiviteSportive activite = new ActiviteSportive(nom, description, capaciteMaximale);
        try {
            return activiteDao.create(activite);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateActivite(ActiviteSportive activite) {
        try {
            return activiteDao.update(activite);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteActivite(int id) {
        try {
            ActiviteSportive activite = activiteDao.findById(id);
            if (activite != null) {
                return activiteDao.delete(activite);
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public ActiviteSportive getActiviteById(int id) {
        try {
            return activiteDao.findById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public List<ActiviteSportive> getAllActivites() {
        try {
            return activiteDao.findAll();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
}