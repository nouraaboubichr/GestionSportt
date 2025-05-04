/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dao.ActiviteSportiveDao;
import dao.CoachDao;
import dao.InscriptionSportDao;
import dao.UserDao;
import entities.ActiviteSportive;
import entities.Admin;
import entities.InscriptionSport;
import entities.User;
import entities.Coach;
import java.time.LocalDate;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import services.ActiviteSportiveService;
import services.InscriptionSportService;
import services.UserService;
import util.HibernateUtil;

/**
 *
 * @author hp
 */
public class Test {
    public static void main(String[] args) {
        // Initialiser la session Hibernate
        HibernateUtil.getSessionFactory();
        
        // Initialiser les services
        ActiviteSportiveService activiteService = new ActiviteSportiveService();
        InscriptionSportService inscriptionService = new InscriptionSportService();
        UserService userService = new UserService();
        
        // Initialiser les DAO
        ActiviteSportiveDao activiteDao = new ActiviteSportiveDao();
        InscriptionSportDao inscriptionDao = new InscriptionSportDao();
        UserDao userDao = new UserDao();
        CoachDao coachDao = new CoachDao();

        // Créer des utilisateurs (par exemple des étudiants)
        User user1 = new User("Ali", "ali@example.com", "password123");
        User user2 = new User("Noura", "noura@example.com", "password456");
        userDao.create(user1);
        userDao.create(user2);

        // Créer un administrateur
        Admin admin1 = new Admin("Admin Principal", "admin@example.com", "adminpass");
        userDao.create(admin1);

        // Créer des coachs
        Coach coach1 = new Coach("Coach A", "coachA@example.com", "coachpass1", 5);
        Coach coach2 = new Coach("Coach B", "coachB@example.com", "coachpass2", 10);
        coachDao.create(coach1);
        coachDao.create(coach2);

        // Créer des activités sportives
        ActiviteSportive activite1 = new ActiviteSportive("Basketball", "Sport de ballon en équipe", 20);
        ActiviteSportive activite2 = new ActiviteSportive("Football", "Sport populaire en équipe", 25);
        activiteDao.create(activite1);
        activiteDao.create(activite2);

        // Utiliser le service pour créer des inscriptions
        System.out.println("\n--- Création des inscriptions ---");
        boolean inscriptionCreated1 = inscriptionService.inscrireUserToActivite(user1.getId(), activite1.getId());
        boolean inscriptionCreated2 = inscriptionService.inscrireUserToActivite(user2.getId(), activite2.getId());
        
        System.out.println("Inscription 1 créée: " + inscriptionCreated1);
        System.out.println("Inscription 2 créée: " + inscriptionCreated2);

        // Afficher toutes les inscriptions sportives
        System.out.println("\n--- Toutes les inscriptions sportives ---");
        List<InscriptionSport> allInscriptions = inscriptionDao.findAll();
        if (allInscriptions != null && !allInscriptions.isEmpty()) {
            for (InscriptionSport inscription : allInscriptions) {
                System.out.println("Activité : " + inscription.getActivite().getNom() +
                                   ", Utilisateur : " + inscription.getUser().getNom() +
                                   ", Date : " + inscription.getDate());
            }
        } else {
            System.out.println("Aucune inscription trouvée.");
        }

        // Afficher les inscriptions pour un utilisateur spécifique (Ali)
        System.out.println("\n--- Inscriptions de l'utilisateur Ali ---");
        List<InscriptionSport> userInscriptions = inscriptionService.getInscriptionsByUser(user1.getId());
        if (userInscriptions != null && !userInscriptions.isEmpty()) {
            for (InscriptionSport inscription : userInscriptions) {
                System.out.println("Activité : " + inscription.getActivite().getNom() +
                                   ", Date : " + inscription.getDate());
            }
        } else {
            System.out.println("Aucune inscription trouvée pour Ali.");
        }

        // Afficher les activités auxquelles Noura est inscrite
        System.out.println("\n--- Activités auxquelles Noura est inscrite ---");
        List<InscriptionSport> nouraInscriptions = inscriptionService.getInscriptionsByUser(user2.getId());
        if (nouraInscriptions != null && !nouraInscriptions.isEmpty()) {
            for (InscriptionSport inscription : nouraInscriptions) {
                System.out.println("Activité : " + inscription.getActivite().getNom() +
                                   ", Date : " + inscription.getDate());
            }
        } else {
            System.out.println("Aucune inscription trouvée pour Noura.");
        }

        // Afficher les inscriptions à l'activité Football
        System.out.println("\n--- Inscriptions à l'activité Football ---");
        List<InscriptionSport> footballInscriptions = inscriptionService.getInscriptionsByActivite(activite2.getId());
        if (footballInscriptions != null && !footballInscriptions.isEmpty()) {
            for (InscriptionSport inscription : footballInscriptions) {
                System.out.println("Utilisateur : " + inscription.getUser().getNom() +
                                   ", Date : " + inscription.getDate());
            }
        } else {
            System.out.println("Aucune inscription trouvée pour le Football.");
        }

        System.out.println("\n--- Test terminé ---");
    }
}