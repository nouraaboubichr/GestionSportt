<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Inscriptions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #ede9f7, #f4f6fc);
            font-family: 'Poppins', sans-serif;
        }

        .container-box {
            max-width: 950px;
            margin: 60px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(111, 66, 193, 0.1);
        }

        h2 {
            color: #6f42c1;
            font-weight: 700;
            text-align: center;
            margin-bottom: 30px;
            border-bottom: 2px solid #6f42c1;
            padding-bottom: 10px;
        }

        .table thead {
            background: linear-gradient(90deg, #6f42c1, #5a34a0);
            color: white;
        }

        .table td, .table th {
            vertical-align: middle;
        }

        .no-data {
            text-align: center;
            font-style: italic;
            color: #999;
            margin-top: 20px;
        }

        .btn-outline-secondary {
            border-radius: 8px;
        }

        .btn-outline-secondary i {
            margin-right: 6px;
        }

        @media (max-width: 768px) {
            .table-responsive {
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>

<div class="container container-box" data-aos="fade-up">
    <h2><i class="bi bi-clipboard2-check me-2"></i>Liste des Inscriptions Sportives</h2>

    <c:if test="${not empty inscriptions}">
        <div class="table-responsive mt-4">
            <table class="table table-bordered table-striped text-center shadow-sm">
                <thead>
                    <tr>
                        <th>Utilisateur</th>
                        <th>Activité</th>
                        <th>Date d'inscription</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="inscription" items="${inscriptions}">
                        <tr>
                            <td>${inscription.user.nom}</td>
                            <td>${inscription.activite.nom}</td>
                            <td>${inscription.date}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

    <c:if test="${empty inscriptions}">
        <p class="no-data">Aucune inscription trouvée pour le moment.</p>
    </c:if>

    <div class="text-end mt-4">
        <a href="<%= request.getContextPath() %>/admin/dashboard" class="btn btn-outline-secondary">
            <i class="bi bi-arrow-left"></i> Retour au tableau de bord
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>
</body>
</html>
