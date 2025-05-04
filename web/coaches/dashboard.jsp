<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Coach</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { background-color: #f8f9fc; }
        .sidebar {
            min-height: 100vh;
            background-color: #fff;
            border-right: 1px solid #dee2e6;
            padding: 1.5rem;
        }
        .sidebar h4 { color: #6f42c1; font-weight: bold; }
        .sidebar a {
            display: block;
            margin: 0.8rem 0;
            color: #555;
            text-decoration: none;
            font-weight: 500;
        }
        .sidebar a:hover { color: #6f42c1; }
        .topbar {
            background-color: #fff;
            padding: 1rem 2rem;
            border-bottom: 1px solid #dee2e6;
        }
        .card-hover:hover {
            box-shadow: 0 0 10px rgba(111, 66, 193, 0.2);
        }
        .btn-purple {
            background-color: #6f42c1;
            color: white;
        }
        .btn-purple:hover {
            background-color: #5a379f;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-2 sidebar">
            <h4><i class="bi bi-person-badge"></i> Coach</h4>
            <a href="${pageContext.request.contextPath}/coaches/dashboard" class="nav-link"><i class="bi bi-house-door me-2"></i> Accueil</a>
            <a href="${pageContext.request.contextPath}/listeActivites" class="nav-link"><i class="bi bi-list-task me-2"></i> Activités</a>
            <a href="${pageContext.request.contextPath}/users/logout.jsp" class="nav-link text-danger mt-3"><i class="bi bi-box-arrow-right me-2"></i> Déconnexion</a>
        </nav>

        <!-- Main -->
        <main class="col-md-10">
            <div class="topbar d-flex justify-content-between align-items-center">
                <h3 class="mb-0">Dashboard Coach</h3>
                <div>
                    <span class="me-3">👋 Bonjour, <c:out value="${sessionScope.user.nom}" /></span>
                    <a href="${pageContext.request.contextPath}/users/logout.jsp" class="btn btn-sm btn-outline-danger">Déconnexion</a>
                </div>
            </div>

            <!-- Content -->
            <div class="container mt-4">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card shadow-sm">
                            <div class="card-header">📋 Vos Activités Sportives</div>
                            <div class="card-body">
                                <c:choose>
                                    <c:when test="${not empty coachActivites}">
                                        <ul class="list-group">
                                            <c:forEach var="act" items="${coachActivites}">
                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                    <strong>${act.nom}</strong>
                                                    <span class="badge bg-secondary">
                                                        ${inscriptionsMap[act.id]} inscrits
                                                    </span>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:when>
                                    <c:otherwise>
                                        <p>Aucune activité assignée.</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>

                    <!-- Optional Section -->
                    <div class="col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-header">📌 Infos Rapides</div>
                            <div class="card-body">
                                <p>Vous encadrez <strong>${fn:length(coachActivites)}</strong> activité(s).</p>
                                <p>Total d’inscriptions : 
                                    <strong>
                                        <c:set var="total" value="0" />
                                        <c:forEach var="entry" items="${inscriptionsMap}">
                                            <c:set var="total" value="${total + entry.value}" />
                                        </c:forEach>
                                        ${total}
                                    </strong>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

</body>
</html>
