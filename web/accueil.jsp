<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Accueil - Club Sportif</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(-45deg, #f8f9fc, #eef1f8, #e3eafc, #f0f4ff);
            background-size: 400% 400%;
            animation: gradientFlow 15s ease infinite;
        }
        @keyframes gradientFlow {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .hero-section {
            height: 100vh;
            background: url('${pageContext.request.contextPath}/images/club-sportif-cover.jpg') no-repeat center center/cover;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            position: relative;
            color: white;
        }
        .hero-section::before {
            content: "";
            position: absolute;
            inset: 0;
            background: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }
        .hero-section .content {
            z-index: 2;
            position: relative;
        }
        .btn-purple {
            background-color: #6f42c1;
            color: white;
            padding: 12px 28px;
            border-radius: 30px;
            font-weight: 600;
            box-shadow: 0 4px 12px rgba(111, 66, 193, 0.2);
            transition: all 0.3s ease-in-out;
        }
        .btn-purple:hover {
            background-color: #5a34a0;
            transform: scale(1.07);
        }
        .features, .info-section {
            margin-top: 3rem;
        }
        .feature-card {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: all 0.3s ease;
        }
        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 18px rgba(0, 0, 0, 0.1);
        }
        .feature-card i {
            font-size: 2.5rem;
            color: #ff6600;
            margin-bottom: 1rem;
        }
        .info-section h4 {
            font-weight: 600;
            color: #6f42c1;
        }
        .footer-section {
            background-color: #0b0c2a;
            color: white;
            padding: 2rem;
            text-align: center;
            margin-top: 4rem;
        }
    </style>
</head>
<body>
<div class="hero-section" data-aos="fade-up">
    <div class="content">
        <h1 class="display-4 fw-bold mb-3">Bienvenue au Club Sportif</h1>
        <p class="lead mb-4">Rejoignez notre communauté dynamique pour des séances sportives encadrées par des professionnels !</p>
        <c:choose>
            <c:when test="${sessionScope.userId != null}">
                <a class="btn btn-purple btn-lg" href="${pageContext.request.contextPath}/users/dashboard.jsp">Accéder au Tableau de Bord</a>
            </c:when>
            <c:otherwise>
                <a class="btn btn-purple btn-lg" href="${pageContext.request.contextPath}/users/login.jsp">Commencer maintenant</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div class="container">
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4 features" data-aos="zoom-in">
        <div class="col">
            <div class="feature-card">
                <i class="bi bi-dribbble"></i>
                <h5 class="fw-semibold">Football</h5>
                <p>Des matchs encadrés avec nos coachs pour progresser dans la bonne humeur.</p>
            </div>
        </div>
        <div class="col">
            <div class="feature-card">
                <i class="bi bi-droplet-half"></i>
                <h5 class="fw-semibold">Piscine</h5>
                <p>Un espace moderne pour l’entraînement, la natation et la détente.</p>
            </div>
        </div>
        <div class="col">
            <div class="feature-card">
                <i class="bi bi-emoji-expressionless"></i>
                <h5 class="fw-semibold">Boxe / Karaté</h5>
                <p>Discipline et performance assurées par des coachs certifiés.</p>
            </div>
        </div>
        <div class="col">
            <div class="feature-card">
                <i class="bi bi-joystick"></i>
                <h5 class="fw-semibold">Ping Pong</h5>
                <p>Réflexes et fun garantis dans un espace moderne et accessible.</p>
            </div>
        </div>
    </div>

    <div class="row text-center mt-5" data-aos="fade-right">
        <h3 class="fw-bold text-primary mb-4">Pourquoi choisir notre club ?</h3>
        <div class="col-md-4">
            <i class="bi bi-stars fs-1 text-warning mb-3"></i>
            <h6>Encadrement Pro</h6>
            <p>Coach diplômés et motivants</p>
        </div>
        <div class="col-md-4">
            <i class="bi bi-graph-up fs-1 text-success mb-3"></i>
            <h6>Progrès Rapide</h6>
            <p>Suivi personnalisé</p>
        </div>
        <div class="col-md-4">
            <i class="bi bi-shield-lock fs-1 text-danger mb-3"></i>
            <h6>Sécurité</h6>
            <p>Installations modernes et sûres</p>
        </div>
    </div>

    <div class="mt-5" data-aos="fade-up">
        <h3 class="text-center text-primary mb-4">Ils parlent de nous</h3>
        <div class="row">
            <div class="col-md-6">
                <blockquote class="blockquote bg-white p-4 rounded shadow-sm">
                    <p>“Un club exceptionnel avec une ambiance familiale. J’ai progressé très vite en boxe !”</p>
                    <footer class="blockquote-footer">Hicham, membre depuis 2023</footer>
                </blockquote>
            </div>
            <div class="col-md-6">
                <blockquote class="blockquote bg-white p-4 rounded shadow-sm">
                    <p>“Le meilleur endroit pour se détendre après les cours. Le staff est top !”</p>
                    <footer class="blockquote-footer">Sara, étudiante UCA</footer>
                </blockquote>
            </div>
        </div>
    </div>

    <div class="text-center mt-5" data-aos="zoom-in">
        <h3 class="text-primary fw-bold mb-3">🎥 Présentation en Vidéo</h3>
        <div class="ratio ratio-16x9 rounded shadow">
            <iframe src="https://www.youtube.com/embed/uVhTWGaT_Wo" 
                title="Présentation Club Sportif" 
                allowfullscreen 
                frameborder="0">
        </iframe>
        </div>
    </div>

    <div class="row info-section mt-5" data-aos="fade-up">
        <div class="col-md-6 mb-4">
            <h4>📍 Où se trouve le club ?</h4>
            <p>Marrakech, à 10 minutes du centre-ville. 3 hectares de sport, nature et sécurité.</p>
        </div>
        <div class="col-md-6 mb-4">
            <h4>🚗 Transport disponible</h4>
            <p>Navette aéroport / hôtel / club sur demande pour un confort optimal.</p>
        </div>
    </div>

    <div class="text-center mt-5" data-aos="fade-up">
        <h4 class="fw-semibold mb-3">Prêt à nous rejoindre ?</h4>
        <a href="${pageContext.request.contextPath}/users/register.jsp" class="btn btn-purple btn-lg">
            S’inscrire maintenant
        </a>
    </div>
</div>

<div class="footer-section">
    &copy; 2025 Club Sportif - Tous droits réservés
</div>
<jsp:include page="includes/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
<script>
    AOS.init({ duration: 1000, once: true });
</script>
</body>
</html>