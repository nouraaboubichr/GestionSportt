<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Réinitialisation - Club Sportif</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6fc;
        }

        .main-container {
            display: flex;
            height: 100vh;
        }

        .left-panel {
            flex: 1;
            background: linear-gradient(rgba(111, 66, 193, 0.7), rgba(111, 66, 193, 0.7)),
                        url('https://images.unsplash.com/photo-1605296867304-46d5465a13f1?fit=crop&w=1000&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 4rem;
        }

        .left-panel h1 {
            font-size: 2.5rem;
            font-weight: bold;
        }

        .left-panel p {
            font-size: 1.1rem;
        }

        .right-panel {
            flex: 1;
            background-color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .form-box {
            width: 100%;
            max-width: 420px;
        }

        .card-title {
            color: #6f42c1;
            font-weight: bold;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .btn-purple {
            background-color: #6f42c1;
            color: white;
            font-weight: bold;
        }

        .btn-purple:hover {
            background-color: #5931a9;
        }

        .form-text-link {
            color: #6f42c1;
            text-decoration: none;
        }

        .form-text-link:hover {
            text-decoration: underline;
        }

        .custom-message {
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>

<div class="main-container">
    <!-- Left content (illustration/message) -->
    <div class="left-panel">
        <h1>Mot de passe oublié ?</h1>
        <p>Pas de panique ! Entrez simplement votre adresse email<br>
           et nous vous enverrons un lien pour le réinitialiser.</p>
    </div>

    <!-- Right content (form) -->
    <div class="right-panel">
        <div class="form-box">

            <!-- Alert -->
            <c:if test="${not empty message}">
                <div class="alert alert-${messageType} custom-message">${message}</div>
            </c:if>

            <!-- Title -->
            <h4 class="card-title">Réinitialiser votre mot de passe</h4>

            <!-- Form -->
            <form action="${pageContext.request.contextPath}/forgot-password" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Adresse email</label>
                    <input type="email" class="form-control" id="email" name="email" required placeholder="ex: nom@exemple.com">
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-purple">Envoyer le lien de réinitialisation</button>
                </div>
            </form>

            <!-- Back to login -->
            <div class="text-center mt-4">
                <a href="${pageContext.request.contextPath}/login" class="form-text-link">← Retour à la connexion</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
