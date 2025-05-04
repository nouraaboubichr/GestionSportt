<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Activités Sportives</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />

    <style>
        body {
            background-color: #f4f6fc;
            font-family: 'Poppins', sans-serif;
        }

        .container-box {
            max-width: 950px;
            margin: 60px auto;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            animation: fadeIn 0.6s ease-in-out;
        }

        h2 {
            color: #6f42c1;
            font-weight: 700;
            text-align: center;
            margin-bottom: 30px;
        }

        .table thead {
            background-color: #6f42c1;
            color: white;
        }

        .table tbody tr:hover {
            background-color: #f8f2ff;
        }

        .no-data {
            text-align: center;
            font-style: italic;
            color: #888;
            padding: 20px 0;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="container container-box" data-aos="fade-up">
    <h2><i class="bi bi-list-task me-2"></i>Liste des Activités Sportives</h2>

    <c:if test="${not empty activites}">
        <table class="table table-bordered table-striped text-center">
            <thead>
                <tr>
                    <th>Nom</th>
                    <th>Description</th>
                    <th>Capacité</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="activite" items="${activites}">
                    <tr>
                        <td>${activite.nom}</td>
                        <td>${activite.description}</td>
                        <td>${activite.capaciteMax}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty activites}">
        <p class="no-data">Aucune activité enregistrée pour le moment.</p>
    </c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>
</body>
</html>
