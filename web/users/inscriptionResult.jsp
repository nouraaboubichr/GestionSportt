<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Résultat de l'inscription</title>
</head>
<body>
    <h2><%= request.getAttribute("message") %></h2>
    <br>
    <a href="users/inscriptionForm.jsp">Retour au formulaire</a> |
    <a href="../accueil.jsp">Accueil</a>
</body>
</html>
