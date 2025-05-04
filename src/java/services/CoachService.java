package services;

import dao.CoachDao;
import entities.Coach;
import java.util.List;

public class CoachService {
    
    private CoachDao coachDao;
    
    public CoachService() {
        coachDao = new CoachDao();
    }
    
    public boolean addCoach(Coach coach) {
        return coachDao.create(coach);
    }
    
    public boolean updateCoach(Coach coach) {
        return coachDao.update(coach);
    }
    
    public boolean deleteCoach(Coach coach) {
        return coachDao.delete(coach);
    }
    
    public Coach getCoachById(int id) {
        return coachDao.findById(id);
    }
    
    public List<Coach> getAllCoaches() {
        return coachDao.findAll();
    }
}