<%@page import="entities.User"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Utilisateurs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #ede9f7, #f8f9fc);
            font-family: 'Poppins', sans-serif;
        }

        .container-box {
            max-width: 1000px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(111, 66, 193, 0.1);
            animation: fadeIn 0.8s ease;
        }

        h2 {
            color: #6f42c1;
            font-weight: 700;
            text-align: center;
            margin-bottom: 30px;
            border-bottom: 2px solid #6f42c1;
            padding-bottom: 10px;
        }

        .table th {
            background-color: #6f42c1;
            color: white;
        }

        .table td, .table th {
            vertical-align: middle;
        }

        .empty-message {
            text-align: center;
            font-style: italic;
            color: #888;
            padding: 20px 0;
        }

        .btn-outline-secondary {
            display: inline-block;
            margin-top: 20px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="container container-box" data-aos="fade-up">
    <h2><i class="bi bi-people-fill me-2"></i>Liste des Utilisateurs</h2>

    <table class="table table-bordered text-center align-middle">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<User> users = (List<User>) request.getAttribute("users");
                if (users != null && !users.isEmpty()) {
                    for (User u : users) {
            %>
                <tr>
                    <td><%= u.getId() %></td>
                    <td><%= u.getNom() %></td>
                    <td><%= u.getEmail() %></td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="3" class="empty-message">Aucun utilisateur trouvé.</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <div class="text-center">
        <a href="<%= request.getContextPath() %>/admin/dashboard" class="btn btn-outline-secondary">
            <i class="bi bi-arrow-left me-1"></i> Retour au dashboard
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
