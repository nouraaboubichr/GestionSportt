<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../includes/header.jsp" />

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-header bg-purple text-white">
                    <h4 class="text-center">Réinitialiser le mot de passe</h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty message}">
                        <div class="alert alert-${messageType}">${message}</div>
                    </c:if>
                    <form action="${pageContext.request.contextPath}/reset-password" method="post">
                        <input type="hidden" name="email" value="${email}" />
                        <div class="mb-3">
                            <label for="newPassword">Nouveau mot de passe</label>
                            <input type="password" name="newPassword" id="newPassword" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-purple w-100">Valider</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../includes/footer.jsp" />
