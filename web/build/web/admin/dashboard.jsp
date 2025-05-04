<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../includes/header.jsp" />

<h2 class="mb-4">Tableau de bord administrateur</h2>

<div class="row">
    <div class="col-md-4">
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                <h5 class="card-title mb-0">Utilisateurs</h5>
            </div>
            <div class="card-body">
                <h1 class="display-4 text-center">${nbUtilisateurs}</h1>
                <p class="text-center">Utilisateurs inscrits</p>
                <div class="text-center">
                    <a href="${pageContext.request.contextPath}/users" class="btn btn-outline-primary">Gérer les utilisateurs</a>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-md-4">
        <div class="card mb-4">
            <div class="card-header bg-success text-white">
                <h5 class="card-title mb-0">Activités</h5>
            </div>
            <div class="card-body">
                <h1 class="display-4 text-center">${nbActivites}</h1>
                <p class="text-center">Activités disponibles</p>
                <div class="text-center">
                    <a href="${pageContext.request.contextPath}/activites" class="btn btn-outline-success">Gérer les activités</a>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-md-4">
        <div class="card mb-4">
            <div class="card-header bg-info text-white">
                <h5 class="card-title mb-0">Inscriptions</h5>
            </div>
            <div class="card-body">
                <h1 class="display-4 text-center">${nbInscriptions}</h1>
                <p class="text-center">Inscriptions totales</p>
                <div class="text-center">
                    <a href="${pageContext.request.contextPath}/inscriptions" class="btn btn-outline-info">Voir les inscriptions</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        <div class="card mb-4">
            <div class="card-header bg-warning">
                <h5 class="card-title mb-0">Statistiques par activité</h5>
            </div>
            <div class="card-body">
                <c:forEach items="${statsActivites}" var="stat">
                    <div class="mb-2">
                        <strong>${stat.key}:</strong> ${stat.value} inscrit(s)
                        <div class="progress">
                            <c:set var="activite" value="${activitesMap[stat.key]}" />
                            <c:set var="pourcentage" value="${(stat.value / activite.capaciteMax) * 100}" />
                            <div class="progress-bar" role="progressbar" style="width: ${pourcentage}%;" 
                                 aria-valuenow="${stat.value}" aria-valuemin="0" aria-valuemax="${activite.capaciteMax}">
                                ${stat.value}/${activite.capaciteMax}
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    
    <div class="col-md-6">
        <div class="card mb-4">
            <div class="card-header bg-danger text-white">
                <h5 class="card-title mb-0">Actions rapides</h5>
            </div>
            <div class="card-body">
                <div class="list-group">
                    <a href="${pageContext.request.contextPath}/activites/create" class="list-group-item list-group-item-action">
                        <i class="fas fa-plus-circle"></i> Ajouter une activité
                    </a>
                    <a href="${pageContext.request.contextPath}/users/create" class="list-group-item list-group-item-action">
                        <i class="fas fa-user-plus"></i> Ajouter un utilisateur
                    </a>
                    <a href="${pageContext.request.contextPath}/coaches/create" class="list-group-item list-group-item-action">
                        <i class="fas fa-user-tie"></i> Ajouter un coach
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/create" class="list-group-item list-group-item-action">
                        <i class="fas fa-user-shield"></i> Ajouter un administrateur
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../includes/footer.jsp" />