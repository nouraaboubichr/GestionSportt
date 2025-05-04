<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des Activités Sportives</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/accueil">Club Sportif</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/activites">Activités</a>
                    </li>
                    <c:if test="${sessionScope.userType == 'admin'}">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">Administration</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/users">Utilisateurs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/coaches">Coaches</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.userType == 'coach'}">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/coaches/mesActivites">Mes Activités</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.userId != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/users/mesInscriptions">Mes Inscriptions</a>
                        </li>
                    </c:if>
                </ul>
                <ul class="navbar-nav">
                    <c:choose>
                        <c:when test="${sessionScope.userId != null}">
                            <li class="nav-item">
                                <span class="nav-link">Bienvenue, ${sessionScope.user.nom}</span>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/logout">Déconnexion</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/users/login">Connexion</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/users/register">Inscription</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-4">
        <c:if test="${not empty requestScope.message}">
            <div class="alert alert-${requestScope.messageType}">
                ${requestScope.message}
            </div>
        </c:if>