# 🏋️‍♀️ Gestion des Inscriptions Sportives

## 📚 Sommaire
- 📌 Contexte  
- ❓ Problématique  
- 🎯 Objectifs  
- 🧩 Diagramme de Classe  
- 🗃️ Modèle Conceptuel de la Base  
- ⚙️ Exécution des Tests  
- 🛠 Technologies Utilisées
- 🎥 [Voir la vidéo de présentation]

---

## 📌 Contexte

Ce projet est une application Java de gestion des activités sportives dans un cadre universitaire ou associatif. Il permet :

- Aux administrateurs de gérer les activités et les coachs  
- Aux utilisateurs de s’inscrire à des activités  
- Aux coachs d'encadrer les activités  
- De suivre les inscriptions et générer des statistiques par activité

---

## ❓ Problématique

La gestion manuelle des inscriptions aux activités sportives pose plusieurs problèmes :

- ❌ Surcharge des administrateurs pour l'enregistrement manuel  
- ❌ Pas de visibilité sur les activités populaires  
- ❌ Difficulté à limiter le nombre d'inscrits selon les capacités  
- ❌ Absence de données exploitables pour les décisions  

---

## 🎯 Objectifs

🎯 Créer une plateforme Java permettant :

- 📋 L’ajout et la gestion des **activités sportives**
- 👤 L’inscription des **utilisateurs** à ces activités
- 🧑‍🏫 La gestion des **coachs** avec leur expérience
- 🧑‍💼 L’ajout d’**administrateurs** pour la supervision
- 📊 Le suivi statistique des inscriptions par activité

---

## 🧩 Diagramme de Classe

![Image](https://github.com/user-attachments/assets/79bfa225-a658-46f3-9343-22862094034f)

## 🗃️ Modèle Conceptuel de la Base
![Image](https://github.com/user-attachments/assets/8205683a-f088-4cb6-bb02-06a006aea6ab)

## ⚙️ Exécution des Tests (console)

![Image](https://github.com/user-attachments/assets/c397d870-6443-46e6-8b5f-8890d1110f17)
![Image](https://github.com/user-attachments/assets/da69274f-afa6-4b2e-848b-55a88db1d97d)
![Image](https://github.com/user-attachments/assets/ca699ea4-bd24-4260-9e10-b40f8717ff31)
![Image](https://github.com/user-attachments/assets/d4cfb948-1bd7-4835-82db-cf07d3a883cf)
![Image](https://github.com/user-attachments/assets/55dbb958-5762-4112-98a7-f3a0c17fb53d)
![Image](https://github.com/user-attachments/assets/213fae97-c7fc-4330-b458-da420f291094)
![Image](https://github.com/user-attachments/assets/e27bf246-46ee-4db9-a6bb-4dfe6a2d1c19)
![Image](https://github.com/user-attachments/assets/ab5dff8a-0d3b-4ae3-bab7-d12e30b73929)
![Image](https://github.com/user-attachments/assets/f2e1f249-1989-4bbf-b77b-0018f8feca35)
![Image](https://github.com/user-attachments/assets/0ebec3da-85b3-4064-b08d-43aa6ba98e10)
![Image](https://github.com/user-attachments/assets/69363f83-2ad4-4dda-935b-ecd2d8e174de)
![Image](https://github.com/user-attachments/assets/8797c5b2-c11e-4bfa-9d7e-97ab4063f488)
![Image](https://github.com/user-attachments/assets/0191831a-7410-44d0-8508-e41738dbf5e0)
![Image](https://github.com/user-attachments/assets/e3a3e957-5d06-4d7b-9ebc-53b5ce690350)
![Image](https://github.com/user-attachments/assets/b3106d73-ecf4-4b9e-9329-f7c644c2c9fe)
![Image](https://github.com/user-attachments/assets/14dde7f3-a3e7-43f9-a6a8-e002143fd713)
![Image](https://github.com/user-attachments/assets/520ff568-32a5-4bcc-8903-b78abf73bb90)
![Image](https://github.com/user-attachments/assets/314bdd28-38cc-4ecc-ae0b-4ca13e619a1f)
![Image](https://github.com/user-attachments/assets/cadf0a82-38bb-4183-8886-b1a1ceeaa6c8)
![Image](https://github.com/user-attachments/assets/e7b32ecd-736f-4aa4-b10e-6ccf582361f2)

### ⚙️ Côté serveur (Backend)
- **Java Web** – Utilisé pour la logique métier.
- **Hibernate** – Pour la persistance des entités sportives, utilisateurs, inscriptions.
- **JDBC** – Pour les requêtes spécifiques.

### 🗃️ Base de Données
- **MySQL** – Stockage des entités.
- **XAMPP** – Pour le serveur MySQL local.
- **phpMyAdmin** – Pour visualiser et manipuler la base de données.



### 🧩 Entités principales :

| Entité             | Description |
|--------------------|-------------|
| **User**           | Utilisateur général (nom, email, mot de passe). |
| **Coach**          | Hérite de `User`, avec champ `experience`. |
| **Admin**          | Hérite de `User`. |
| **ActiviteSportive** | Nom, description, capacité maximale. |
| **InscriptionSport** | Activité, utilisateur inscrit, date. |

### 🎥 [Voir la vidéo de présentation](https://drive.google.com/file/d/18Uk8LbNofxaztdO_6o2mmuTaZXofTRGN/view?usp=drive_link)



---

