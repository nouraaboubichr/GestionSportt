<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../includes/header.jsp" />

<h2 class="mb-4">Mes Inscriptions</h2>

<c:choose>
    <c:when test="${empty inscriptions}">
        <div class="alert alert-info">
            Vous n'êtes inscrit à aucune activité pour le moment.
            <a href="${pageContext.request.contextPath}/activites">Découvrir nos activités</a>
        </div>
    </c:when>
    <c:otherwise>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Activité</th>
                        <th>Description</th>
                        <th>Date d'inscription</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${inscriptions}" var="inscription">
                        <tr>
                            <td>${inscription.activite.nom}</td>
                            <td>${inscription.activite.description}</td>
                            <td><fmt:formatDate value="${inscription.date}" pattern="dd/MM/yyyy" /></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/activites/details?id=${inscription.activite.id}" class="btn btn-sm btn-info">Détails</a>
                                <a href="${pageContext.request.contextPath}/inscriptions/annuler?activiteId=${inscription.activite.id}" class="btn btn-sm btn-danger" onclick="return confirm('Êtes-vous sûr de vouloir annuler cette inscription?')">Annuler</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:otherwise>
</c:choose>

<jsp:include page="../includes/footer.jsp" />