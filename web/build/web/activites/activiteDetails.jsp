<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../includes/header.jsp" />

<div class="row">
    <div class="col-md-8">
        <div class="card">
            <div class="card-header">
                <h3>${activite.nom}</h3>
            </div>
            <div class="card-body">
                <p class="card-text">${activite.description}</p>
                <p class="card-text"><strong>Capacité maximale:</strong> ${activite.capaciteMax} personnes</p>
                <p class="card-text"><strong>Places occupées:</strong> ${activite.inscriptions.size()} / ${activite.capaciteMax}</p>
                
                <c:if test="${sessionScope.userId != null && activite.inscriptions.size() < activite.capaciteMax}">
                    <c:choose>
                        <c:when test="${estInscrit}">
                            <a href="${pageContext.request.contextPath}/inscriptions/annuler?activiteId=${activite.id}" class="btn btn-danger">Se désinscrire</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/inscriptions/ajouter?activiteId=${activite.id}" class="btn btn-success">S'inscrire</a>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                
                <c:if test="${sessionScope.userType == 'admin'}">
                    <a href="${pageContext.request.contextPath}/activites/edit?id=${activite.id}" class="btn btn-warning">Modifier</a>
                    <a href="${pageContext.request.contextPath}/activites/delete?id=${activite.id}" class="btn btn-danger" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette activité?')">Supprimer</a>
                </c:if>
            </div>
        </div>
    </div>
    
    <div class="col-md-4">
        <div class="card">
            <div class="card-header">
                <h4>Liste des inscrits</h4>
            </div>
            <div class="card-body">
                <c:choose>
                    <c:when test="${empty activite.inscriptions}">
                        <p>Aucune inscription pour le moment.</p>
                    </c:when>
                    <c:otherwise>
                        <ul class="list-group">
                            <c:forEach items="${activite.inscriptions}" var="inscription">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    ${inscription.user.nom}
                                    <span class="badge badge-primary badge-pill">
                                        <fmt:formatDate value="${inscription.date}" pattern="dd/MM/yyyy" />
                                    </span>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../includes/footer.jsp" />