<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Afriquia Race of Morocco 2024</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fc;
        }

        .header-img {
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 0 0 15px 15px;
        }

        .content {
            padding: 2rem;
        }

        h1 {
            font-weight: 700;
            color: #6f42c1;
        }

        .btn-retour {
            background-color: #6f42c1;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 8px 20px;
        }

        .btn-retour:hover {
            background-color: #5a379f;
        }
    </style>
</head>
<body>

<!-- Image de couverture -->
<img src="https://store.clubs.ma/api/passes/media/e5d61cc5-5277-40d3-939f-86f626d4f360/450x360.webp" class="header-img" alt="Afriquia Race of Morocco">

<!-- Contenu -->
<div class="container content">
    <h1>Afriquia Race of Morocco 2024</h1>
    <p class="text-muted mb-4"><i class="bi bi-calendar-event me-2"></i>3 & 4 mai 2024 · Circuit Moulay El Hassan, Marrakech</p>

    <p>
        Le célèbre circuit Moulay El Hassan de Marrakech accueillera la 11e édition du **Afriquia Race of Morocco**. Cet événement emblématique
        est l’unique manche africaine du **TCR World Tour**, réunissant les meilleurs pilotes et écuries internationales de voitures de tourisme.
    </p>

    <h5 class="mt-4">🏎️ Ce qui vous attend :</h5>
    <ul>
        <li>Compétitions automobiles internationales</li>
        <li>Village racing, food court et animations</li>
        <li>Accès paddocks (en option VIP)</li>
    </ul>

    <h5 class="mt-4">🎟️ Billets & Inscriptions :</h5>
    <ul>
        <li>Billets en vente à partir de 100 DH</li>
        <li>Formules VIP avec accès tribune, zone paddock, boissons & snacks</li>
        <li>Gratuit pour les enfants de moins de 10 ans</li>
    </ul>

    <a href="evenements.jsp" class="btn btn-retour mt-4">← Retour aux événements</a>
</div>

<jsp:include page="includes/footer.jsp" />
</body>
</html>
