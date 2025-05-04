<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Club Sportif</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        .top-bar {
            background-color: #1d1d1d;
            color: #ffffff;
            font-size: 0.875rem;
            padding: 5px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .main-navbar {
            background-color: #fff;
            padding: 15px 30px;
            border-bottom: 2px solid #e5e5e5;
            font-weight: 600;
        }

        .main-navbar .nav-link {
            color: #111 !important;
            margin-right: 20px;
            text-transform: uppercase;
            font-size: 0.95rem;
        }

        .main-navbar .nav-link:hover {
            color: #6f42c1 !important;
        }

       .btn-inscrire {
    background-color: #fcb415;  /* couleur extraite */
    color: #000000;
    font-weight: 700;
    text-transform: uppercase;
    border: none;
    padding: 10px 24px;
    border-radius: 4px;
    font-size: 0.9rem;
    margin-right: 10px;
}

.btn-connexion {
    background-color: #000000;  /* noir */
    color: #ffffff;
    font-weight: 700;
    text-transform: uppercase;
    border: none;
    padding: 10px 24px;
    border-radius: 4px;
    font-size: 0.9rem;
}

    </style>
</head>
<body>

<!-- Bandeau supérieur -->
<div class="top-bar">
    <div>La plateforme N°1 des clubs et salles de sport au Maroc</div>
    <div>
        <a href="#" class="text-white text-decoration-none me-3">Devenir partenaire</a>
        <a href="#" class="text-white text-decoration-none">Rejoignez ClubSportif</a>
    </div>
</div>

<!-- Navbar principale -->
<!-- Navbar -->
<nav class="main-navbar d-flex align-items-center justify-content-between flex-wrap">
    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/accueil.jsp">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" style="height: 30px;" class="me-2">
    </a>

    <div class="d-flex flex-wrap align-items-center gap-4">
        <a class="nav-link fw-bold" href="activites.jsp">ACTIVITÉS SPORTIVES</a>
        <a class="nav-link fw-bold" href="evenements.jsp">ÉVÉNEMENTS</a>
        <a class="nav-link fw-bold" href="contact.jsp">CONTACT</a>
    </div>

    <div class="d-flex align-items-center gap-2">
        <a class="btn btn-warning btn-sm fw-bold px-3" href="${pageContext.request.contextPath}/users/register.jsp">S’INSCRIRE</a>
        <a class="btn btn-dark btn-sm fw-bold px-3" href="${pageContext.request.contextPath}/users/login.jsp">SE CONNECTER</a>
    </div>
</nav>

