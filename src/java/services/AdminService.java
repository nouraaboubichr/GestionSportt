// AdminService.java
package services;

import dao.AdminDao;
import entities.Admin;
import java.util.List;

public class AdminService {
    
    private AdminDao adminDao;
    
    public AdminService() {
        adminDao = new AdminDao();
    }
    
    public boolean addAdmin(Admin admin) {
        // Vérifier si l'email existe déjà (comme dans UserService)
        List<Admin> existingAdmins = adminDao.findByEmail(admin.getEmail());
        if (existingAdmins != null && !existingAdmins.isEmpty()) {
            return false;
        }
        return adminDao.create(admin);
    }
    
    public boolean updateAdmin(Admin admin) {
        return adminDao.update(admin);
    }
    
    public boolean deleteAdmin(Admin admin) {
        return adminDao.delete(admin);
    }
    
    public Admin getAdminById(Long id) {
        return adminDao.findById(id);
    }
    
    // Méthode surchargée pour compatibilité avec les appels existants
    public Admin getAdminById(int id) {
        return adminDao.findById(Long.valueOf(id));
    }
    
    public List<Admin> getAllAdmins() {
        return adminDao.findAll();
    }
    
    public Admin getAdminByEmail(String email) {
        List<Admin> admins = adminDao.findByEmail(email);
        if (admins != null && !admins.isEmpty()) {
            return admins.get(0);
        }
        return null;
    }
    
    public Admin authenticateAdmin(String email, String motDePasse) {
        Admin admin = getAdminByEmail(email);
        if (admin != null && admin.getMotDePasse().equals(motDePasse)) {
            return admin;
        }
        return null;
    }
}