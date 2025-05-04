<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Espace Utilisateur</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background-color: #f4f6fc;
            font-family: 'Poppins', sans-serif;
        }

        .sidebar {
            min-height: 100vh;
            background: linear-gradient(180deg, #6f42c1, #5a34a0);
            color: white;
            padding: 1.5rem;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            margin-bottom: 1.2rem;
            font-weight: 500;
        }

        .sidebar a:hover {
            background-color: rgba(255,255,255,0.1);
            padding-left: 12px;
            border-radius: 6px;
        }

        .topbar {
            background-color: #fff;
            padding: 1rem 2rem;
            border-bottom: 1px solid #dee2e6;
        }

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background: linear-gradient(90deg, #6f42c1, #5a34a0);
            color: white;
            font-weight: 600;
        }

        .btn-purple {
            background-color: #6f42c1;
            color: white;
        }

        .btn-purple:hover {
            background-color: #5a34a0;
        }

        .card-body canvas {
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scaleY(0.95); }
            to { opacity: 1; transform: scaleY(1); }
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-2 sidebar">
            <h4 class="mb-4"><i class="bi bi-heart-pulse-fill me-2"></i>Club Sportif</h4>
            <a href="${pageContext.request.contextPath}/users/dashboard.jsp"><i class="bi bi-house-door me-2"></i>Accueil</a>
            <a href="${pageContext.request.contextPath}/listeActivites"><i class="bi bi-list-task me-2"></i>Activités</a>
            <a href="${pageContext.request.contextPath}/InscriptionSportController"><i class="bi bi-card-checklist me-2"></i>Mes inscriptions</a>
            <hr class="text-white opacity-50">
            <a href="${pageContext.request.contextPath}/users/logout.jsp" class="text-danger mt-4 d-block"><i class="bi bi-box-arrow-right me-2"></i>Déconnexion</a>
        </nav>

        <!-- Main content -->
        <main class="col-md-10">
            <!-- Topbar -->
            <div class="topbar d-flex justify-content-between align-items-center">
 <h4 class="mb-0">Bienvenue <span style="color:#6f42c1;"><c:out value="${sessionScope.user.nom}" /></span></h4>
                <div class="d-flex align-items-center gap-3">
                    <div class="rounded-circle d-flex justify-content-center align-items-center text-white fw-bold shadow-sm"
                         style="background-color: #6f42c1; width: 40px; height: 40px; font-size: 16px;">
                        CU
                    </div>
                    <a href="${pageContext.request.contextPath}/users/logout.jsp" class="btn btn-sm btn-outline-danger">Déconnexion</a>
                </div>
            </div>
            

            <!-- Contenu utilisateur -->
            <div class="container mt-4">
                <div class="row g-4 mb-4">
                    <!-- Activités -->
                    <div class="col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-body text-center">
                                <h5 class="card-title">🏃 Activités variées</h5>
                                <p class="card-text">Un large éventail d'activités sportives pour tous les goûts.</p>
                                <a href="${pageContext.request.contextPath}/listeActivites" class="btn btn-outline-primary">Voir plus</a>
                            </div>
                        </div>
                    </div>

                    <!-- Inscription -->
                    <div class="col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-body text-center">
                                <h5 class="card-title">📝 S'inscrire facilement</h5>
                                <p class="card-text">En quelques clics, inscrivez-vous à vos activités favorites.</p>
                                <a href="${pageContext.request.contextPath}/loadInscriptionForm" class="btn btn-purple">S'inscrire</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Graphique -->
                <div class="row">
                    <div class="col-md-8">
                        <div class="card shadow-sm">
                            <div class="card-header">📊 Fréquentation des inscriptions</div>
                            <div class="card-body">
                                <canvas id="chartInscriptions"></canvas>
                            </div>
                        </div>
                    </div>

                    <!-- Dernière inscription -->
                    <div class="col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-header">🕒 Dernière inscription</div>
                            <div class="card-body">
                                <p><strong>Activité :</strong> Yoga</p>
                                <p><strong>Date :</strong> 01/05/2025</p>
                                <p><strong>Statut :</strong> Confirmée ✅</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Script Chart -->
<script>
    const ctx = document.getElementById('chartInscriptions');
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'],
            datasets: [{
                label: 'Nombre d\'inscriptions',
                data: [2, 5, 3, 7, 4, 6, 8],
                fill: true,
                borderColor: '#6f42c1',
                backgroundColor: 'rgba(111,66,193,0.1)',
                tension: 0.3
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });
</script>

</body>
</html>
