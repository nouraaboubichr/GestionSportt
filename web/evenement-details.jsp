<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Détail Événement - Club Sportif</title>
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

<img src="https://store.clubs.ma/api/passes/media/1646c019-4713-4f9c-b947-fed2399db8ad/450x360.webp" class="header-img" alt="Bouskoura">

<div class="container content">
    <h1>15KM de Bouskoura 2025</h1>
    <p class="text-muted mb-4"><i class="bi bi-calendar-event me-2"></i>11 mai 2025 · Bouskoura</p>

    <p>
        Participez à la 11ᵉ édition du 15km de Bouskoura, une course solidaire organisée au profit des SOS Villages d’Enfants Maroc.
        Deux distances sont proposées : 10 km et 15 km. Les coureurs recevront un dossard, une médaille, et participeront à une belle action sociale !
    </p>

    <h5 class="mt-4">👟 Inscriptions :</h5>
    <ul>
        <li>Ouvert à tous les âges à partir de 16 ans</li>
        <li>Prix : 200 DH</li>
        <li>Lieu de départ : Forêt de Bouskoura</li>
    </ul>

    <h5 class="mt-4">🎁 Avantages :</h5>
    <ul>
        <li>Maillot officiel + médaille offerte</li>
        <li>Animation musicale, stands santé et bien-être</li>
        <li>Ambiance festive, parcours sécurisé</li>
    </ul>

    <a href="evenements.jsp" class="btn btn-retour mt-4">← Retour aux événements</a>
</div>

<jsp:include page="includes/footer.jsp" />
</body>
</html>
