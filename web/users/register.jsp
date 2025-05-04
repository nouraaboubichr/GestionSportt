<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription - Club Sportif</title>
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
            max-width: 480px;
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
    <!-- Left content -->
    <div class="left-panel">
        <h1>Bienvenue au Club Sportif</h1>
        <p>Créez votre compte pour accéder aux activités, vous inscrire et suivre vos performances sportives.</p>
    </div>

    <!-- Right content -->
    <div class="right-panel">
        <div class="form-box">
            <c:if test="${not empty message}">
                <div class="alert alert-${messageType} custom-message">${message}</div>
            </c:if>

            <h4 class="card-title">Créer un compte</h4>

            <form method="post" action="${pageContext.request.contextPath}/register">
                <div class="mb-3">
                    <label for="nom" class="form-label">Nom complet</label>
                    <input type="text" class="form-control" id="nom" name="nom" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Adresse email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>

                <div class="mb-3">
                    <label for="motDePasse" class="form-label">Mot de passe</label>
                    <input type="password" class="form-control" id="motDePasse" name="motDePasse" required>
                </div>

                <div class="mb-3">
                    <label for="type" class="form-label">Type de compte</label>
                    <select class="form-select" name="type" id="type" required onchange="toggleExperience()">
                        <option value="user">Utilisateur</option>
                        <option value="coach">Coach</option>
                        <option value="admin">Administrateur</option>
                    </select>
                </div>

                <div class="mb-3" id="experienceField" style="display: none;">
                    <label for="experience" class="form-label">Expérience (en années)</label>
                    <input type="number" class="form-control" id="experience" name="experience" min="0">
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-purple">Créer le compte</button>
                </div>

                <div class="text-center mt-4">
                    Déjà un compte ? <a href="${pageContext.request.contextPath}/users/login.jsp" class="form-text-link">Se connecter</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function toggleExperience() {
        const type = document.getElementById("type").value;
        const exp = document.getElementById("experienceField");
        exp.style.display = type === "coach" ? "block" : "none";
    }
</script>

</body>
</html>
