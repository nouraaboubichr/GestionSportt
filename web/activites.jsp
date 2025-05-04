<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Activités Sportives</title>

    <!-- Styles et bibliothèques -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fc;
            margin: 0;
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

        .section-title {
            font-weight: 600;
            color: #6f42c1;
            margin: 3rem 0 1rem;
            text-align: center;
        }

        .activity-card {
            display: flex;
            background-color: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }

        .activity-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0,0,0,0.08);
        }

        .activity-image {
            width: 220px;
            object-fit: cover;
        }

        .activity-body {
            flex: 1;
            padding: 20px;
        }

        .activity-info {
            text-align: end;
            padding: 20px;
            border-left: 1px solid #eee;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            min-width: 170px;
        }

        .activity-info h5 {
            color: #6f42c1;
        }

        .btn-reserver {
            background-color: #ffc107;
            color: #111;
            font-weight: 600;
            border: none;
            border-radius: 30px;
            transition: 0.3s ease;
        }

        .btn-reserver:hover {
            background-color: #e0a800;
            color: white;
        }

        @media (max-width: 768px) {
            .activity-card {
                flex-direction: column;
            }
            .activity-info {
                border-left: none;
                border-top: 1px solid #eee;
                flex-direction: row;
                justify-content: space-between;
                text-align: left;
            }
        }
    </style>
</head>
<body>

<!-- Hero Section -->
<div class="hero-section">
    <div class="content">
        <h1 class="display-5 fw-bold" data-aos="fade-down">Nos Activités Sportives</h1>
        <p class="lead" data-aos="fade-up">Explorez notre large gamme d’activités encadrées par des experts.</p>
    </div>
</div>

<!-- Section activités -->
<div class="container my-5">
    <h2 class="section-title">Choisissez votre activité</h2>

    <div class="row gy-4">

        <!-- Activité 1 -->
        <div class="col-12" data-aos="fade-up">
            <div class="activity-card">
                <img src="https://store.clubs.ma/api/passes/media/3e976e26-c0ba-4c3e-9200-deab8c4902e5/450x360.webp" class="activity-image" alt="Foot 5">
                <div class="activity-body">
                    <h5 class="fw-bold text-uppercase">Location terrain foot à 5</h5>
                    <p class="mb-1 text-muted">Chez Urban Five 5 – Foot à Marrakech</p>
                    <p class="mb-0 text-secondary">Réservez dès maintenant pour seulement 150 MAD. Une heure intense entre amis !</p>
                </div>
                <div class="activity-info">
                    <div>
                        <small class="text-muted">Prix Exclusif</small>
                        <h5 class="fw-bold">150 DH</h5>
                    </div>
                    <a href="${pageContext.request.contextPath}/users/login.jsp" class="btn btn-reserver">⏵ Réserver</a>
                </div>
            </div>
        </div>

        <!-- Activité 2 -->
        <div class="col-12" data-aos="fade-up" data-aos-delay="100">
            <div class="activity-card">
                <img src="https://store.clubs.ma/api/passes/media/5c0c0f74-f1f6-4840-b276-e416499964cc/large.webp" class="activity-image" alt="Flyboard">
                <div class="activity-body">
                    <h5 class="fw-bold text-uppercase">Session 30min de Flyboard</h5>
                    <p class="mb-1 text-muted">Jet Ski Académie Agadir</p>
                    <p class="mb-0 text-secondary">Envolez-vous au-dessus des vagues à seulement 600 MAD.</p>
                </div>
                <div class="activity-info">
                    <div>
                        <small class="text-muted">Prix Exclusif</small>
                        <h5 class="fw-bold">600 DH</h5>
                    </div>
                    <a href="${pageContext.request.contextPath}/users/login.jsp" class="btn btn-reserver">⏵ Réserver</a>
                </div>
            </div>
        </div>

        <!-- Activité 3 -->
        <div class="col-12" data-aos="fade-up" data-aos-delay="200">
            <div class="activity-card">
                <img src="https://store.clubs.ma/api/passes/media/c07f63e7-25b5-481b-b1a9-e28b0a0d1268/450x360.webp" class="activity-image" alt="Jet Ski">
                <div class="activity-body">
                    <h5 class="fw-bold text-uppercase">Session 1h de Jet Ski</h5>
                    <p class="mb-1 text-muted">Jet Ski Académie Agadir</p>
                    <p class="mb-0 text-secondary">À 950 MAD, profitez d’une heure d’adrénaline en mer Atlantique.</p>
                </div>
                <div class="activity-info">
                    <div>
                        <small class="text-muted">Prix Exclusif</small>
                        <h5 class="fw-bold">950 DH</h5>
                    </div>
                    <a href="${pageContext.request.contextPath}/users/login.jsp" class="btn btn-reserver">⏵ Réserver</a>
                </div>
            </div>
        </div>

        <!-- Activité 4 -->
        <div class="col-12" data-aos="fade-up" data-aos-delay="300">
            <div class="activity-card">
                <img src="https://store.clubs.ma/api/passes/media/5538dfb0-8bbb-4555-a055-af9999784e79/450x360.webp" class="activity-image" alt="Escalade">
                <div class="activity-body">
                    <h5 class="fw-bold text-uppercase">Cours particulier d’escalade</h5>
                    <p class="mb-1 text-muted">Le Mur – Rabat</p>
                    <p class="mb-0 text-secondary">2h d’encadrement personnalisé pour 350 MAD. Équipement inclus.</p>
                </div>
                <div class="activity-info">
                    <div>
                        <small class="text-muted">Prix Exclusif</small>
                        <h5 class="fw-bold">350 DH</h5>
                    </div>
                    <a href="${pageContext.request.contextPath}/users/login.jsp" class="btn btn-reserver">⏵ Réserver</a>
                </div>
            </div>
        </div>

    </div>
</div>

<jsp:include page="includes/footer.jsp" />

<!-- Animation AOS -->
<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
<script>
    AOS.init({ duration: 1000, once: true });
</script>

</body>
</html>
