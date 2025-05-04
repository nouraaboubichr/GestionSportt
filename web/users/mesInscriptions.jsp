<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.InscriptionSport" %>
<%@ page import="entities.User" %>

<%
    User user = (User) session.getAttribute("user");
    List<InscriptionSport> inscriptions = (List<InscriptionSport>) request.getAttribute("inscriptions");
    String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Mes Inscriptions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #ede9f7, #f4f6fc);
            font-family: 'Poppins', sans-serif;
        }

        .container {
            margin-top: 60px;
            max-width: 1000px;
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.05);
            padding: 30px;
        }

        .title-text {
            color: #6f42c1;
            font-weight: 700;
            text-align: center;
            margin-bottom: 25px;
            border-bottom: 2px solid #6f42c1;
            padding-bottom: 10px;
        }

        .table th {
            background-color: #f4edff;
            color: #6f42c1;
        }

        .btn-violet {
            background-color: #6f42c1;
            color: white;
        }

        .btn-violet:hover {
            background-color: #5a34a0;
        }

        .btn-outline-violet {
            color: #6f42c1;
            border-color: #6f42c1;
        }

        .btn-outline-violet:hover {
            background-color: #6f42c1;
            color: white;
        }

        .message {
            font-size: 0.95rem;
        }

        @media (max-width: 768px) {
            .table-responsive { overflow-x: auto; }
        }
    </style>

    <script>
        function confirmSuppression() {
            return confirm("Êtes-vous sûr de vouloir annuler cette inscription ?");
        }
    </script>
</head>
<body>

<div class="container" data-aos="fade-up">
    <div class="card">
        <h2 class="title-text"><i class="bi bi-card-checklist me-2"></i>Mes Inscriptions</h2>

        <% if (message != null) { %>
            <div class="alert alert-success text-center message" data-aos="zoom-in"><%= message %></div>
        <% } %>

        <% if (user == null) { %>
            <div class="alert alert-danger text-center">Vous devez être connecté.</div>
            <div class="text-center">
                <a href="<%= request.getContextPath() %>/index.jsp" class="btn btn-secondary">Accueil</a>
            </div>
        <% } else if (inscriptions != null && !inscriptions.isEmpty()) { %>
            <div class="table-responsive mt-4">
                <table class="table table-bordered align-middle text-center">
                    <thead>
                        <tr>
                            <th>Activité</th>
                            <th>Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (InscriptionSport i : inscriptions) { %>
                            <tr>
                                <td><%= i.getActivite().getNom() %></td>
                                <td><%= i.getDate() %></td>
                                <td>
                                    <!-- Supprimer -->
                                    <form action="<%= request.getContextPath() %>/InscriptionSportController" method="post"
                                          style="display:inline;" onsubmit="return confirmSuppression();">
                                        <input type="hidden" name="action" value="delete"/>
                                        <input type="hidden" name="userId" value="<%= user.getId() %>"/>
                                        <input type="hidden" name="activiteId" value="<%= i.getActivite().getId() %>"/>
                                        <button type="submit" class="btn btn-outline-danger btn-sm">Annuler</button>
                                    </form>

                                    <!-- Modifier -->
                                    <form action="<%= request.getContextPath() %>/InscriptionSportController" method="get"
                                          style="display:inline;">
                                        <input type="hidden" name="action" value="showForm"/>
                                        <input type="hidden" name="userId" value="<%= user.getId() %>"/>
                                        <input type="hidden" name="edit" value="true"/>
                                        <input type="hidden" name="activiteId" value="<%= i.getActivite().getId() %>"/>
                                        <button type="submit" class="btn btn-outline-violet btn-sm">Modifier</button>
                                    </form>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } else { %>
            <div class="alert alert-warning text-center">Aucune inscription enregistrée.</div>
        <% } %>

        <div class="text-center mt-4">
            <a href="<%= request.getContextPath() %>/InscriptionSportController?action=showForm&userId=<%= user != null ? user.getId() : "" %>"
               class="btn btn-violet me-2">Nouvelle inscription</a>
            <a href="<%= request.getContextPath() %>/users/dashboard.jsp" class="btn btn-outline-secondary">Accueil</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>AOS.init();</script>
</body>
</html>
