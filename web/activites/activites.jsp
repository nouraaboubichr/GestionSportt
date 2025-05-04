<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des activités sportives</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <style>
        body {
            background-color: #f4f6fc;
            font-family: 'Poppins', sans-serif;
            padding-top: 40px;
        }

        .card {
            animation: fadeIn 0.6s ease-in-out;
        }

        .card-header {
            background: linear-gradient(90deg, #6f42c1, #5a34a0);
            color: white;
            font-weight: bold;
        }

        .btn-violet {
            background-color: #6f42c1;
            color: white;
        }

        .btn-violet:hover {
            background-color: #5a34a0;
            color: white;
        }

        .btn-outline-violet {
            border-color: #6f42c1;
            color: #6f42c1;
        }

        .btn-outline-violet:hover {
            background-color: #6f42c1;
            color: white;
        }

        .message {
            background-color: #ede3ff;
            border-left: 5px solid #6f42c1;
        }

        .table th {
            background-color: #eee4fc;
            text-align: center;
        }

        .table td {
            vertical-align: middle;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>

    <script>
        function confirmDelete(id, nom) {
            if (confirm("Êtes-vous sûr de vouloir supprimer l'activité '" + nom + "' ?")) {
                window.location.href = "ActiviteSportiveController?action=delete&id=" + id;
            }
        }
    </script>
</head>
<body>

<div class="container">
    <div class="card shadow-sm" data-aos="fade-up">
        <div class="card-header text-center">
            <h2><i class="bi bi-list-task me-2"></i>Liste des activités sportives</h2>
        </div>
        <div class="card-body">
            <c:if test="${not empty message}">
                <div class="alert message p-3">${message}</div>
            </c:if>

            <div class="mb-3 text-end">
                <a href="ActiviteSportiveController?action=showForm" class="btn btn-violet">
                    <i class="bi bi-plus-circle me-1"></i> Ajouter une activité
                </a>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered table-hover align-middle">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nom</th>
                            <th>Description</th>
                            <th>Capacité</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="activite" items="${activites}">
                            <tr>
                                <td class="text-center">${activite.id}</td>
                                <td>${activite.nom}</td>
                                <td>${activite.description}</td>
                                <td class="text-center">${activite.capaciteMax}</td>
                                <td class="text-center">
                                    <a href="ActiviteSportiveController?action=edit&id=${activite.id}" class="btn btn-sm btn-outline-violet me-2">
                                        <i class="bi bi-pencil-square"></i> Modifier
                                    </a>
                                    <button onclick="confirmDelete(${activite.id}, '${activite.nom}')" class="btn btn-sm btn-outline-danger">
                                        <i class="bi bi-trash"></i> Supprimer
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty activites}">
                            <tr>
                                <td colspan="5" class="text-center text-muted">Aucune activité sportive trouvée.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>

            <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-outline-secondary mt-3">
                <i class="bi bi-arrow-left me-1"></i> Retour au dashboard
            </a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>
</body>
</html>
