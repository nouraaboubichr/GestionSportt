<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Contact - Club Sportif</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fc;
        }

        .hero-section {
            position: relative;
            background: url('${pageContext.request.contextPath}/images/club-sportif-cover.jpg') no-repeat center center/cover;
            height: 60vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
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
            position: relative;
            z-index: 2;
        }

        .btn-purple {
            background-color: #6f42c1;
            color: white;
            border: none;
            padding: 10px 24px;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-purple:hover {
            background-color: #5a379f;
            transform: translateY(-2px);
        }

        .section-title {
            font-weight: 600;
            position: relative;
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
        }

        .section-title::after {
            content: "";
            width: 60px;
            height: 3px;
            background-color: #6f42c1;
            position: absolute;
            bottom: 0;
            left: 0;
        }

        .contact-info {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
        }

        .contact-info h5 {
            font-weight: 600;
        }

        .contact-info p {
            font-size: 15px;
            margin-bottom: 10px;
        }

        .btn-fb {
            background-color: #3b5998;
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            border: none;
        }

        .btn-fb:hover {
            background-color: #2d4373;
        }

        .info-icon {
            color: #6f42c1;
            margin-right: 8px;
        }
    </style>
</head>
<body>

<!-- Hero Section -->
<div class="hero-section">
    <div class="content" data-aos="fade-up">
        <h1 class="display-4 fw-bold mb-3">Contactez-nous</h1>
        <p class="lead mb-4">Nous sommes là pour vous accompagner et répondre à vos questions.</p>
    </div>
</div>

<!-- Content -->
<div class="container py-5">
    <div class="row">
        <!-- Description -->
        <div class="col-md-8" data-aos="fade-right">
            <h2 class="section-title">ClubSportif : votre plateforme d'activités sportives</h2>
            <p>
                ClubSportif est une plateforme web et mobile conçue pour <strong>promouvoir la pratique du sport au Maroc</strong>.
                Elle aide les utilisateurs à <strong>trouver facilement des clubs ou salles de sport</strong> près de chez eux.
            </p>
            <p>
                Vous êtes propriétaire d’un club ? Rejoignez-nous gratuitement pour présenter vos services et gagner en visibilité.
                Créez une fiche, ajoutez vos horaires, photos, tarifs et vidéos.
            </p>

            <h2 class="section-title mt-5">Reconnaissances & Récompenses</h2>
            <p>
                Lauréat des <strong>Maroc Web Awards</strong>, ClubSportif a été sélectionné parmi les <strong>10 meilleures startups</strong> sportives du pays.
            </p>
        </div>

        <!-- Contact Sidebar -->
        <div class="col-md-4" data-aos="fade-left">
            <div class="contact-info">
                <h4 class="mb-3 border-bottom pb-2"><i class="bi bi-envelope-fill info-icon"></i>Contact</h4>
                <p><i class="bi bi-geo-alt-fill info-icon"></i>Marrakech, Maroc</p>
                <hr>
                <h5><i class="bi bi-star-fill info-icon"></i>Service Référencement</h5>
                <p>contact@clubsportif.ma</p>

                <h5 class="mt-3"><i class="bi bi-life-preserver info-icon"></i>Support général</h5>
                <p>support@clubsportif.ma</p>

                <a href="#" class="btn btn-fb mt-3 w-100"><i class="bi bi-facebook me-2"></i>Page Facebook</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
<script>
    AOS.init({ duration: 1000, once: true });
</script>

</body>
</html>
