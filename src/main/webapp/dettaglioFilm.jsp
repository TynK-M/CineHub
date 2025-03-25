<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>${film.titolo}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="styles/global.css" rel="stylesheet">
</head>
<body>

<%@ include file="componenti/navbar.jsp" %>

<div class="container mt-5">
    <!-- Titolo e descrizione -->
    <h1 class="mb-3">${film.titolo}</h1>
    <p>${film.descrizione}</p>

    <!-- Trailer YouTube -->
    <c:if test="${not empty film.linkTrailer}">
        <div class="ratio ratio-16x9 mb-4">
            <iframe src="${film.linkTrailer}" title="Trailer" allowfullscreen></iframe>
        </div>
    </c:if>

    <!-- Sezione commenti -->
    <h3 class="mt-5">Giudizi degli utenti</h3>
    <c:if test="${not empty giudizi}">
        <ul class="list-group mt-3">
            <c:forEach var="g" items="${giudizi}">
                <li class="list-group-item">
                    <strong>${g.utente.nome} ${g.utente.cognome}:</strong>
                    <span>
                        <c:forEach begin="1" end="5" var="i">
                            <c:choose>
                                <c:when test="${i <= g.stelle}">
                                    ⭐
                                </c:when>
                                <c:otherwise>☆</c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </span>
                    <br>
                    <small>${g.commento}</small>
                </li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty giudizi}">
        <p class="text-muted mt-3">Nessun giudizio ancora presente.</p>
    </c:if>

    <!-- Form invio giudizio -->
    <c:if test="${isUtenteLoggato}">
        <h4 class="mt-5">Lascia un giudizio</h4>
        <form method="post" action="CommentoServlet" class="mt-3">
            <input type="hidden" name="filmId" value="${film.id}">
            <div class="mb-3">
                <label for="stelle" class="form-label">Stelle (1-5):</label>
                <select name="stelle" id="stelle" class="form-select" required>
                    <c:forEach begin="1" end="5" var="s">
                        <option value="${s}">${s}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label for="commento" class="form-label">Commento:</label>
                <textarea name="commento" id="commento" class="form-control" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Invia giudizio</button>
        </form>
    </c:if>
    <c:if test="${not isUtenteLoggato}">
        <p class="mt-4 text-muted">Devi <a href="login.jsp">accedere</a> per lasciare un giudizio.</p>
    </c:if>
</div>

<%@ include file="componenti/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
