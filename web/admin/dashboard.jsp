<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Club Sportif</title>
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
            box-shadow: inset 0 -1px 0 rgba(255,255,255,0.2);
        }
        .card-body i {
            font-size: 2.4rem;
            color: #6f42c1;
        }
        .btn-outline-custom {
            border-color: #6f42c1;
            color: #6f42c1;
        }
        .btn-outline-custom:hover {
            background-color: #6f42c1;
            color: white;
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
            <h4 class="mb-5"><i class="bi bi-heart-pulse-fill me-2"></i>Club Sportif</h4>
            <a href="${pageContext.request.contextPath}/admin/dashboard"><i class="bi bi-speedometer2 me-2"></i>Tableau de bord</a>
            <a href="${pageContext.request.contextPath}/listeActivites"><i class="bi bi-basket me-2"></i>Activités</a>
            <a href="${pageContext.request.contextPath}/listeInscriptions"><i class="bi bi-card-checklist me-2"></i>Inscriptions</a>
            <a href="${pageContext.request.contextPath}/ListeController"><i class="bi bi-people me-2"></i>Utilisateurs</a>
            <hr class="text-white opacity-50">
            <a href="${pageContext.request.contextPath}/users/logout.jsp" class="text-danger mt-4 d-block"><i class="bi bi-box-arrow-right me-2"></i>Déconnexion</a>
        </nav>

        <!-- Main content -->
        <main class="col-md-10">
            <!-- Topbar -->
            <div class="topbar d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Bienvenue sur <span style="color:#6f42c1;">Club Sportif</span> Admin</h4>
                <div class="d-flex align-items-center gap-3">
                    <div class="rounded-circle d-flex justify-content-center align-items-center text-white fw-bold shadow-sm"
                         style="background-color: #6f42c1; width: 40px; height: 40px; font-size: 16px;">
                        A
                    </div>
                    <a href="${pageContext.request.contextPath}/users/logout.jsp" class="btn btn-sm btn-outline-danger">Déconnexion</a>
                </div>
            </div>

            <!-- Dashboard content -->
            <div class="container mt-4">
                <!-- Statistiques cartes -->
                <div class="row text-center">
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm">
                            <div class="card-header">Utilisateurs</div>
                            <div class="card-body">
                                <i class="bi bi-people-fill"></i>
                                <h1>${nbUtilisateurs}</h1>
                                <p>Utilisateurs inscrits</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm">
                            <div class="card-header">Activités</div>
                            <div class="card-body">
                                <i class="bi bi-basket"></i>
                                <h1>${nbActivites}</h1>
                                <p>Activités disponibles</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm">
                            <div class="card-header">Inscriptions</div>
                            <div class="card-body">
                                <i class="bi bi-card-checklist"></i>
                                <h1>${nbInscriptions}</h1>
                                <p>Total des inscriptions</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Graphique animé -->
                <div class="card shadow-sm mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <span><i class="bi bi-bar-chart-line me-2"></i>Statistiques d'inscription</span>
                        <span class="badge bg-light text-dark fw-normal">Données en temps réel</span>
                    </div>
                    <div class="card-body">
                        <canvas id="chartActivites" height="100"></canvas>
                    </div>
                </div>

                <!-- Actions rapides + dernière inscription -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card shadow-sm mb-4">
                            <div class="card-header">Actions rapides</div>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/ActiviteSportiveController" class="btn btn-outline-custom w-100 mb-2">
                                    <i class="bi bi-plus-circle me-1"></i> Ajouter une activité
                                </a>
                                <a href="${pageContext.request.contextPath}/UserController?action=new&type=user" class="btn btn-outline-custom w-100 mb-2">
                                    <i class="bi bi-person-plus me-1"></i> Ajouter un utilisateur
                                </a>
                                <a href="${pageContext.request.contextPath}/UserController?action=new&type=coach" class="btn btn-outline-custom w-100 mb-2">
                                    <i class="bi bi-person-badge me-1"></i> Ajouter un coach
                                </a>
                                <a href="${pageContext.request.contextPath}/UserController?action=new&type=admin" class="btn btn-outline-custom w-100">
                                    <i class="bi bi-shield-lock me-1"></i> Ajouter un admin
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card shadow-sm mb-4">
                            <div class="card-header d-flex align-items-center"><i class="bi bi-clock-history me-2"></i>Dernière inscription</div>
                            <div class="card-body">
                                <p><strong>Activité :</strong> Yoga</p>
                                <p><strong>Date :</strong> 01/05/2025</p>
                                <p><strong>Statut :</strong> <span class="badge bg-success">Confirmée</span></p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </main>
    </div>
</div>

<!-- Chart.js Script -->
<script>
    const dataActivites = [
        <c:forEach var="entry" items="${statsActivites}" varStatus="loop">
        {
            nom: "${entry.key}",
            inscrits: ${entry.value},
            capacite: ${activitesMap[entry.key].capaciteMax}
        }<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];

    const ctx = document.getElementById('chartActivites').getContext('2d');
    const chart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: dataActivites.map(d => d.nom),
            datasets: [{
                label: 'Taux d\'inscription (%)',
                data: dataActivites.map(d => ((d.inscrits / d.capacite) * 100).toFixed(1)),
                backgroundColor: 'rgba(111, 66, 193, 0.8)',
                borderRadius: 6,
                hoverBackgroundColor: '#5931a9'
            }]
        },
        options: {
            animation: {
                duration: 1500,
                easing: 'easeOutBounce'
            },
            plugins: {
                tooltip: {
                    callbacks: {
                        label: ctx => ctx.raw + '%'
                    }
                },
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    max: 100,
                    ticks: {
                        callback: value => value + '%'
                    }
                }
            }
        }
    });
</script>

</body>
</html>
