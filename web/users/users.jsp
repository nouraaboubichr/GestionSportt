<%@page import="entities.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Utilisateurs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #ede9f7, #f4f6fc);
            font-family: 'Poppins', sans-serif;
            padding: 40px 20px;
        }

        .container {
            max-width: 1100px;
            margin: auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.06);
            padding: 40px;
            animation: fadeIn 1s ease-in;
        }

        h1 {
            font-size: 28px;
            font-weight: 700;
            color: #6f42c1;
            margin-bottom: 25px;
            border-bottom: 3px solid #6f42c1;
            padding-bottom: 10px;
        }

        .btn-violet {
            background-color: #6f42c1;
            color: white;
            font-weight: 500;
            border-radius: 6px;
            transition: 0.3s ease;
        }

        .btn-violet:hover {
            background-color: #5a34a0;
        }

        .btn-warning, .btn-danger {
            font-size: 13px;
            padding: 5px 10px;
        }

        .btn-warning:hover {
            background-color: #e0a800;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .message-box {
            background-color: #ede3ff;
            border-left: 4px solid #6f42c1;
            padding: 10px 15px;
            margin-bottom: 20px;
            color: #4b3670;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        th {
            background-color: #f4edff;
            color: #6f42c1;
            padding: 12px 15px;
            font-size: 15px;
        }

        td {
            padding: 12px 15px;
            vertical-align: middle;
        }

        tr {
            transition: all 0.3s ease;
        }

        tr:hover {
            background-color: #f9f6ff;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .empty-message {
            text-align: center;
            padding: 20px;
            color: #888;
            font-style: italic;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="container" data-aos="fade-up">
    <h1><i class="bi bi-people-fill me-2"></i>Liste des Utilisateurs</h1>

    <% String message = (String) request.getAttribute("message");
       if (message != null) { %>
        <div class="message-box" data-aos="zoom-in">
            <%= message %>
        </div>
    <% } %>

    <a href="${pageContext.request.contextPath}/UserController?action=showForm" class="btn btn-violet mb-3" data-aos="fade-right">
        <i class="bi bi-plus-circle me-1"></i> Ajouter un utilisateur
    </a>

    <table class="table table-hover table-striped" data-aos="fade-up" data-aos-delay="100">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<User> users = (List<User>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) {
                for (User user : users) {
        %>
        <tr data-aos="fade-up" data-aos-delay="150">
            <td><%= user.getId() %></td>
            <td><%= user.getNom() %></td>
            <td><%= user.getEmail() %></td>
            <td class="action-buttons">
                <a href="${pageContext.request.contextPath}/UserController?action=edit&id=<%= user.getId() %>" class="btn btn-warning btn-sm">Modifier</a>
                <a href="${pageContext.request.contextPath}/UserController?action=delete&id=<%= user.getId() %>" class="btn btn-danger btn-sm"
                   onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet utilisateur ?');">Supprimer</a>
            </td>
        </tr>
        <% } } else { %>
        <tr>
            <td colspan="4" class="empty-message">Aucun utilisateur trouvé.</td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-outline-secondary mt-4">
        <i class="bi bi-arrow-left me-1"></i> Retour au tableau de bord
    </a>
</div>

<!-- Scripts -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>AOS.init();</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
