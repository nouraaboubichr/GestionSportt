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

![Image](https://github.com/user-attachments/assets/d4c20627-96a1-4bf6-8722-52289f4be9a8)
![Image](https://github.com/user-attachments/assets/5479f0fb-efe4-47e5-8035-3f33603f4fa9)
![Image](https://github.com/user-attachments/assets/450c2865-ce8b-4b18-a008-9034101af856)
![Image](https://github.com/user-attachments/assets/3f9241be-60d8-45f9-ab9a-baf8e5770cd0)
![Image](https://github.com/user-attachments/assets/c273dff0-fa2f-4b7c-b81b-86152f682a6b)
![Image](https://github.com/user-attachments/assets/788b819d-aab9-4e99-bad4-75249c4cb1ec)
![Image](https://github.com/user-attachments/assets/17ce7c9f-b786-412a-88d6-a39d8408fd5c)
![Image](https://github.com/user-attachments/assets/30d28b3f-8114-446c-af54-19b158e1b8b4)
![Image](https://github.com/user-attachments/assets/d60b8c25-3c30-43eb-916f-825df4271beb)
![Image](https://github.com/user-attachments/assets/52d085ad-2397-4c43-b881-2b9756f417d6)
![Image](https://github.com/user-attachments/assets/271af8cf-038b-4524-8ce4-fc30986b4f59)
![Image](https://github.com/user-attachments/assets/5997bdc9-ca19-47cb-b4fa-416fa6e19883)
![Image](https://github.com/user-attachments/assets/9fe3b4fd-fbaa-49df-9688-dd1237bd3317)
![Image](https://github.com/user-attachments/assets/a84965b1-4e8b-4e19-ac72-5b580dee1e1b)
![Image](https://github.com/user-attachments/assets/1b1a6e93-3c39-409b-9af4-f3ff5412974f)
![Image](https://github.com/user-attachments/assets/687f8c46-aaab-42a3-b40f-218b27d5c021)
![Image](https://github.com/user-attachments/assets/0c14d3d4-6bcf-4ea5-b2ac-dc74655197f9)
![Image](https://github.com/user-attachments/assets/86e35a44-1271-4870-b2a6-b2ac87c7d62c)
![Image](https://github.com/user-attachments/assets/c81db75c-7326-4132-abc9-a5a2fefb80c6)
![Image](https://github.com/user-attachments/assets/f774e498-1ebd-4a51-a948-4059b3c258c3)

## 🛠 Technologies

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

