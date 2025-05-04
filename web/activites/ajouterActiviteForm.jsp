<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des activités sportives</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f6fc;
            font-family: 'Poppins', sans-serif;
            padding: 40px 0;
        }

        .form-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
            animation: fadeIn 0.6s ease-in-out;
        }

        .form-title {
            color: #6f42c1;
            font-weight: 600;
            text-align: center;
        }

        .btn-violet {
            background-color: #6f42c1;
            color: white;
        }

        .btn-violet:hover {
            background-color: #5a34a0;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-outline-secondary i {
            margin-right: 5px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="form-container mx-auto col-md-8" data-aos="zoom-in">
        <h2 class="form-title mb-4">
            ${activite != null ? 'Modifier une activité' : 'Ajouter une nouvelle activité'}
        </h2>

        <form action="ActiviteSportiveController" method="post">
            <c:if test="${activite != null}">
                <input type="hidden" name="id" value="${activite.id}" />
                <input type="hidden" name="action" value="update" />
            </c:if>
            <c:if test="${activite == null}">
                <input type="hidden" name="action" value="create" />
            </c:if>

            <div class="mb-3">
                <label for="nom" class="form-label">Nom</label>
                <input type="text" id="nom" name="nom" class="form-control" value="${activite != null ? activite.nom : ''}" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea id="description" name="description" class="form-control" rows="4" required>${activite != null ? activite.description : ''}</textarea>
            </div>

            <div class="mb-4">
                <label for="capaciteMaximale" class="form-label">Capacité maximale</label>
                <input type="number" id="capaciteMaximale" name="capaciteMaximale" class="form-control" value="${activite != null ? activite.capaciteMax : '10'}" min="1" required>
            </div>

            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-violet">
                    <i class="bi bi-check-circle me-1"></i> ${activite != null ? 'Mettre à jour' : 'Ajouter'}
                </button>
                <a href="ActiviteSportiveController" class="btn btn-outline-secondary">
                    <i class="bi bi-arrow-left"></i> Annuler
                </a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>
</body>
</html>
