<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion - Club Sportif</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9fc;
        }

        .main-container {
            display: flex;
            height: 100vh;
        }

        .left-panel {
    flex: 1;
    background-image: linear-gradient(rgba(111, 66, 193, 0.6), rgba(111, 66, 193, 0.6)),
                      url('${pageContext.request.contextPath}/images/bg-club.jpg');
    background-size: 110%;
    background-position: center;
    background-repeat: no-repeat;
    color: white;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 4rem;

    /* Animation du zoom */
    animation: zoomBackground 15s ease-in-out infinite;
}

/* Animation définie ici */
@keyframes zoomBackground {
    0%   { background-size: 110%; }
    50%  { background-size: 115%; }
    100% { background-size: 110%; }
}



        .left-panel h1 {
            font-size: 2.8rem;
            font-weight: bold;
        }

        .right-panel {
            flex: 1;
            background-color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .login-box {
            width: 100%;
            max-width: 400px;
        }

        .logo {
            font-size: 2rem;
            color: #6f42c1;
            font-weight: bold;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            animation: floatLogo 3s ease-in-out infinite;
        }

        .logo i {
            font-size: 1.8rem;
            margin-right: 0.5rem;
        }

        .btn-purple {
            background-color: #6f42c1;
            color: white;
        }

        .btn-purple:hover {
            background-color: #5a379f;
        }

        .form-text-link {
            color: #6f42c1;
            font-size: 0.9rem;
        }

        .form-text-link:hover {
            text-decoration: underline;
        }

        .custom-message {
            color: #6f42c1;
            text-align: center;
            font-weight: bold;
            margin-bottom: 1rem;
        }

        @keyframes floatLogo {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-6px); }
            100% { transform: translateY(0px); }
        }
    </style>
</head>
<body>

<div class="main-container">
    <!-- Panneau gauche de bienvenue -->
    <div class="left-panel">
        <h1>Bienvenue sur Club Sportif</h1>
        <p class="mt-3">Accédez à votre espace personnel pour gérer vos activités sportives<br>
           et suivre vos inscriptions en temps réel.</p>
    </div>

    <!-- Panneau droit avec formulaire -->
    <div class="right-panel">
        <div class="login-box">

            <!-- Logo avec animation -->
            <div class="logo mb-4">
                <i class="bi bi-heart-pulse-fill"></i> Club Sportif
            </div>

            <!-- Message conditionnel -->
            <c:if test="${not empty message}">
                <div class="custom-message">${message}</div>
            </c:if>

            <!-- Formulaire de connexion -->
            <form method="post" action="${pageContext.request.contextPath}/login">
                <div class="mb-3">
                    <label for="email" class="form-label">Adresse Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>

                <div class="mb-3">
                    <label for="motDePasse" class="form-label">Mot de passe</label>
                    <input type="password" class="form-control" id="motDePasse" name="motDePasse" required>
                    <div class="text-end mt-1">
                        <a href="${pageContext.request.contextPath}/users/forgot-password.jsp" class="form-text-link">Mot de passe oublié ?</a>
                    </div>
                </div>

                <div class="d-grid mb-3">
                    <button type="submit" class="btn btn-purple">Se connecter</button>
                </div>

                <div class="text-center">
                    <span>Vous n’avez pas de compte ? </span>
                    <a href="${pageContext.request.contextPath}/users/register.jsp" class="form-text-link">S’inscrire</a>
                </div>
            </form>

        </div>
    </div>
</div>

</body>
</html>
