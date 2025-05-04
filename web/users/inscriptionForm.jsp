<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.ActiviteSportive" %>
<%@ page import="entities.User" %>

<%
    User user = (User) session.getAttribute("user");
    List<ActiviteSportive> activites = (List<ActiviteSportive>) request.getAttribute("activites");
    String action = request.getParameter("edit") != null ? "update" : "create";
    String currentActiviteId = request.getParameter("activiteId");
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title><%= ("update".equals(action)) ? "Modifier Inscription" : "Nouvelle Inscription" %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #ede9f7, #f4f6fc);
            font-family: 'Poppins', sans-serif;
        }

        .container {
            margin-top: 60px;
            max-width: 600px;
        }

        .card {
            background-color: #ffffff;
            border: 1px solid #ddd;
            box-shadow: 0 8px 24px rgba(111, 66, 193, 0.1);
            padding: 30px;
            border-radius: 12px;
            animation: fadeIn 0.8s ease;
        }

        .title-text {
            color: #6f42c1;
            font-weight: 600;
            border-bottom: 2px solid #6f42c1;
            padding-bottom: 10px;
        }

        .btn-violet {
            background-color: #6f42c1;
            color: white;
            font-weight: 500;
        }

        .btn-violet:hover {
            background-color: #5a34a0;
        }

        .form-label {
            font-weight: 500;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="container" data-aos="fade-up">
    <div class="card">
        <h2 class="title-text text-center mb-4">
            <%= ("update".equals(action)) ? "Modifier votre inscription" : "Inscription à une activité" %>
        </h2>

        <% if (user == null) { %>
            <div class="alert alert-danger text-center">
                Vous devez être connecté.
            </div>
            <div class="text-center">
                <a href="<%= request.getContextPath() %>/index.jsp" class="btn btn-secondary">Retour</a>
            </div>
        <% } else { %>
            <form action="<%= request.getContextPath() %>/InscriptionSportController" method="post">
                <input type="hidden" name="action" value="<%= action %>"/>
                <input type="hidden" name="userId" value="<%= user.getId() %>"/>
                <% if ("update".equals(action)) { %>
                    <input type="hidden" name="oldActiviteId" value="<%= currentActiviteId %>"/>
                <% } %>

                <div class="mb-3">
                    <label for="activiteId" class="form-label">Choisir une activité :</label>
                    <select class="form-select" name="activiteId" id="activiteId" required>
                        <% for (ActiviteSportive a : activites) { %>
                            <option value="<%= a.getId() %>" 
                                <%= (String.valueOf(a.getId()).equals(currentActiviteId)) ? "selected" : "" %>>
                                <%= a.getNom() %> - Capacité: <%= a.getCapaciteMax() %>
                            </option>
                        <% } %>
                    </select>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-violet">
                        <i class="bi <%= "update".equals(action) ? "bi-pencil-square" : "bi-check2-circle" %> me-1"></i>
                        <%= ("update".equals(action)) ? "Modifier" : "S'inscrire" %>
                    </button>
                </div>
            </form>

            <div class="mt-4 text-center">
                <a href="<%= request.getContextPath() %>/InscriptionSportController" class="btn btn-outline-secondary">
                    <i class="bi bi-arrow-left me-1"></i> Retour à mes inscriptions
                </a>
            </div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>
</body>
</html>
