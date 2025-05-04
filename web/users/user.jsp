<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Formulaire Utilisateur</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(to right, #ede9f7, #f4f6fc);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .form-container {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            padding: 40px;
            width: 100%;
            max-width: 550px;
            animation: fadeIn 1s ease;
        }

        h2 {
            font-size: 24px;
            color: #6f42c1;
            font-weight: 600;
            text-align: center;
            margin-bottom: 25px;
            border-bottom: 3px solid #6f42c1;
            display: inline-block;
            padding-bottom: 6px;
        }

        label {
            font-weight: 500;
            color: #444;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 20px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #6f42c1;
            box-shadow: 0 0 0 3px rgba(111, 66, 193, 0.2);
            outline: none;
        }

        .btn-purple {
            background-color: #6f42c1;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            width: 100%;
            font-weight: 500;
            transition: background-color 0.3s;
        }

        .btn-purple:hover {
            background-color: #5a34a0;
        }

        .error-message {
            color: #dc3545;
            font-size: 14px;
            margin-bottom: 10px;
            text-align: center;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="form-container" data-aos="fade-up">
    <h2><i class="bi bi-person-fill me-2"></i>Formulaire Utilisateur</h2>

    <% if(request.getAttribute("error") != null) { %>
        <div class="error-message">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <%
        User user = (User) request.getAttribute("user");
        boolean isUpdate = user != null;

        String nom = "";
        String email = "";
        String motDePasse = "";
        String id = "";

        if (isUpdate) {
            nom = user.getNom();
            email = user.getEmail();
            motDePasse = user.getMotDePasse();
            id = user.getId().toString();
        } else {
            nom = request.getParameter("nom") != null ? request.getParameter("nom") : "";
            email = request.getParameter("email") != null ? request.getParameter("email") : "";
            motDePasse = request.getParameter("motDePasse") != null ? request.getParameter("motDePasse") : "";
            id = request.getParameter("id") != null ? request.getParameter("id") : "";
        }
    %>

    <form method="POST" action="${pageContext.request.contextPath}/UserController">
        <input type="hidden" name="id" value="<%= id %>" />
        <input type="hidden" name="action" value="<%= isUpdate ? "update" : "create" %>" />

        <div class="mb-3">
            <label for="nom">Nom :</label>
            <input type="text" id="nom" name="nom" value="<%= nom %>" placeholder="Entrez votre nom" required />
        </div>

        <div class="mb-3">
            <label for="email">Email :</label>
            <input type="text" id="email" name="email" value="<%= email %>" placeholder="Entrez votre email" required />
        </div>

        <div class="mb-4">
            <label for="motDePasse">Mot de passe :</label>
            <input type="password" id="motDePasse" name="motDePasse" value="<%= motDePasse %>" placeholder="Entrez votre mot de passe" required />
        </div>

        <input type="submit" class="btn-purple" value="<%= isUpdate ? "Mettre à jour" : "Enregistrer" %>" />
    </form>
</div>

<!-- Scripts -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>AOS.init();</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
