<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Événements - Club Sportif</title>

    <!-- CSS externes -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet">
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
            color: white;
            text-align: center;
        }

        .hero-section::before {
            content: "";
            position: absolute;
            inset: 0;
            background: rgba(0, 0, 0, 0.6);
            z-index: 0;
        }

        .hero-section .content {
            position: relative;
            z-index: 1;
        }

        .section-title {
            color: #111;
            font-size: 2rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 1rem;
        }

        .section-sub {
            text-align: center;
            color: #6f42c1;
            margin-bottom: 3rem;
        }

        .event-card {
            border-radius: 12px;
            overflow: hidden;
            background-color: white;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .event-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .event-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .event-card .card-body {
            padding: 1.5rem;
        }

        .event-title {
            font-weight: 700;
            font-size: 1.3rem;
            color: #333;
        }

        .event-meta {
            font-size: 0.9rem;
            color: #6c757d;
            margin-bottom: 0.75rem;
        }

        .event-desc {
            font-size: 0.95rem;
            color: #444;
            margin-bottom: 1.2rem;
        }

        .btn-readmore {
            background-color: #6f42c1;
            color: white;
            font-weight: 500;
            padding: 8px 18px;
            border-radius: 30px;
            text-transform: uppercase;
            font-size: 0.85rem;
            transition: 0.3s ease;
            border: none;
        }

        .btn-readmore:hover {
            background-color: #5a379f;
            color: #fff;
        }
    </style>
</head>
<body>

<!-- Section Hero -->
<div class="hero-section">
    <div class="content">
        <h1 class="display-5 fw-bold" data-aos="fade-down">Événements Sportifs</h1>
        <p class="lead" data-aos="fade-up">Participez à nos événements exclusifs et compétitions locales</p>
    </div>
</div>

<!-- Liste des événements -->
<div class="container py-5">
    <h2 class="section-title" data-aos="fade-right">Tous les évènements sportifs au Maroc</h2>
    <p class="section-sub" data-aos="fade-left">Vous trouverez ici les prochains événements sportifs à ne pas manquer.</p>

    <div class="row g-4">
        <!-- Événement 1 -->
        <div class="col-md-6" data-aos="zoom-in-up">
            <div class="event-card">
                <img src="https://store.clubs.ma/api/passes/media/1646c019-4713-4f9c-b947-fed2399db8ad/450x360.webp" alt="15KM Bouskoura">
                <div class="card-body">
                    <h5 class="event-title">15KM de Bouskoura 2025</h5>
                    <div class="event-meta">
                        <i class="bi bi-calendar-event me-1"></i> 11 mai 2025 · Bouskoura
                    </div>
                    <p class="event-desc">
                        Courez pour changer des vies ! En participant aux 10 ou 15 km, vous soutenez les SOS Villages d’Enfants Maroc.
                    </p>
                    <a href="evenement-details.jsp" class="btn btn-readmore">Lire la suite</a>
                </div>
            </div>
        </div>

        <!-- Événement 2 -->
        <div class="col-md-6" data-aos="zoom-in-up" data-aos-delay="100">
            <div class="event-card">
                <img src="https://store.clubs.ma/api/passes/media/e5d61cc5-5277-40d3-939f-86f626d4f360/450x360.webp" alt="Afriquia Race">
                <div class="card-body">
                    <h5 class="event-title">Afriquia Race of Morocco 2024</h5>
                    <div class="event-meta">
                        <i class="bi bi-geo-alt me-1"></i> 3-4 mai 2024 · Marrakech
                    </div>
                    <p class="event-desc">
                        Vivez la seule manche africaine du TCR World Tour sur le circuit Moulay El Hassan, avec les meilleurs pilotes internationaux.
                    </p>
                    <a href="evenement-afriquia.jsp" class="btn btn-readmore">Lire la suite</a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />

<!-- Scripts AOS -->
<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
<script>
    AOS.init({ duration: 1000, once: true });
</script>

</body>
</html>
