<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />

<div class="jumbotron">
    <h1 class="display-4">Bienvenue au Club Sportif</h1>
    <p class="lead">Découvrez nos activités sportives et inscrivez-vous dès maintenant !</p>
    <hr class="my-4">
    <p>Le Club Sportif vous propose de nombreuses activités pour tous les niveaux et tous les âges.</p>
    <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/activites" role="button">Voir les activités</a>
</div>

<div class="row">
    <div class="col-md-4">
        <div class="card mb-4">
            <div class="card-body text-center">
                <h5 class="card-title">Activités variées</h5>
                <p class="card-text">Nous proposons un large éventail d'activités sportives pour tous les goûts.</p>
                <a href="${pageContext.request.contextPath}/activites" class="btn btn-outline-primary">Découvrir</a>
            </div>
        </div>
    </div>
    
    <div class="col-md-4">
        <div class="card mb-4">
            <div class="card-body text-center">
                <h5 class="card-title">Coaches expérimentés</h5>
                <p class="card-text">Nos coaches qualifiés vous accompagnent dans votre pratique sportive.</p>
                <a href="${pageContext.request.contextPath}/coaches" class="btn btn-outline-primary">En savoir plus</a>
            </div>
        </div>
    </div>
    
    <div class="col-md-4">
        <div class="card mb-4">
            <div class="card-body text-center">
                <h5 class="card-title">Inscription facile</h5>
                <p class="card-text">Inscrivez-vous en quelques clics à nos activités sportives.</p>
                <c:choose>
                    <c:when test="${sessionScope.userId != null}">
                        <a href="${pageContext.request.contextPath}/activites" class="btn btn-outline-primary">S'inscrire</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/users/login" class="btn btn-outline-primary">Se connecter</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />