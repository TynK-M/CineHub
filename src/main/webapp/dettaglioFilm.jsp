<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.lang.Math" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>${film.titolo}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="styles/global.css" rel="stylesheet">
</head>
<body class="bg-dark text-light">

<%@ include file="componenti/navbar.jsp" %>

<div class="container mt-5">

    <h1 class="mb-3">${film.titolo}</h1>
    <p class="mb-4">${film.descrizione}</p>

    <!-- Locandina + Trailer -->
    <div class="row mb-4">
        <div class="col-md-6">
            <c:if test="${not empty film.locandina}">
                <img src="${film.locandina}" class="img-fluid rounded shadow" alt="Locandina ${film.titolo}">
            </c:if>
        </div>
        <div class="col-md-6">
            <c:if test="${not empty film.linkTrailer}">
                <div class="ratio ratio-16x9">
                    <iframe src="${film.linkTrailer}" title="Trailer" allowfullscreen></iframe>
                </div>
            </c:if>
        </div>
    </div>

    <!-- Media giudizi -->
    <c:if test="${not empty giudizi}">
        <div class="alert alert-info text-dark">
            <%
                java.util.List<?> giudizi = (java.util.List<?>) request.getAttribute("giudizi");
                int somma = 0;
                for (Object obj : giudizi) {
                    org.generationitaly.cinehub.entity.Giudizio g = (org.generationitaly.cinehub.entity.Giudizio) obj;
                    somma += g.getStelle();
                }
                int media = (int) Math.ceil((double) somma / giudizi.size());
            %>
            <strong>Media giudizi:</strong>
            <c:forEach begin="1" end="5" var="i">
                <c:choose>
                    <c:when test="${i <= media}">⭐</c:when>
                    <c:otherwise>☆</c:otherwise>
                </c:choose>
            </c:forEach>
            (<%= media %>/5)
        </div>
    </c:if>

    <!-- Commenti -->
    <h3 class="mt-4">Giudizi degli utenti</h3>
    <c:if test="${not empty giudizi}">
        <ul class="list-group mt-3">
            <c:forEach var="g" items="${giudizi}">
                <li class="list-group-item">
                    <strong>
                        <a href="ProfiloServlet?id=${g.utente.id}">
                                ${g.utente.nome} ${g.utente.cognome}
                        </a>:
                    </strong>
                    <span>
                        <c:forEach begin="1" end="5" var="i">
                            <c:choose>
                                <c:when test="${i <= g.stelle}">⭐</c:when>
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
        <p class="text-muted mt-3" style="color: white !important;">Nessun commento ancora presente.</p>
    </c:if>

    <!-- Form commento -->
    <c:if test="${isUtenteLoggato and not haGiaCommentato}">
        <h4 class="mt-5">Lascia un commento</h4>
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
            <button type="submit" class="btn btn-primary">Invia commento</button>
        </form>
    </c:if>
    <c:if  test="${isUtenteLoggato and haGiaCommentato}">
        <p  class="mt-4 text-muted " ><span style="color: white;">Hai già lasciato un commento per questo film.</span></p>
    </c:if>
    <c:if test="${not isUtenteLoggato}">
        <p class="mt-4 text-muted" style="color: white !important;">Devi <a href="autenticazione/login.jsp">accedere</a> per lasciare un commento.</p>
    </c:if>

    <!-- Pulsante Prenota -->
    <c:if test="${isUtenteLoggato and not haGiaCommentato}">
        <c:if test="${filmInSala}">
            <div class="text-center mt-5">
                <a href="ListaSpettacoliServlet?filmId=${film.id}" class="btn btn-success btn-lg">
                    Prenota questo film
                </a>
            </div>
        </c:if>
    </c:if>
</div>

<%@ include file="componenti/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
