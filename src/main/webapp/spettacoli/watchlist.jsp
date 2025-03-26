<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  <!-- IMPORTANTE -->
<%@ include file="../componenti/navbar.jsp" %>
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <title>La mia Watchlist</title>
  <!-- Bootstrap -->
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
  <!-- Stili -->
  <link href="styles/global.css" rel="stylesheet">
  <link href="styles/index.css" rel="stylesheet">
  <link href="styles/global.css" rel="stylesheet">
</head>
<body class="bg-dark text-light">
<div class="container mt-5">
  <h2 class="mb-4 text-center">La tua Watchlist</h2>

  <c:choose>
    <c:when test="${empty watchlist}">
      <div class="alert alert-secondary text-center">
        Nessun film salvato nella tua Watchlist.
      </div>
    </c:when>
    <c:otherwise>
      <div class="row">
        <c:forEach var="w" items="${watchlist}">
          <div class="col-md-4 mb-4">
            <div class="card bg-secondary text-light h-100 shadow">
              <c:if test="${not empty w.film.locandina}">
                <img src="${w.film.locandina}"
                     class="card-img-top"
                     alt="Locandina ${w.film.titolo}"
                     style="height: 300px; object-fit: cover;">
              </c:if>
              <div class="card-body">
                <h5 class="card-title">${w.film.titolo}</h5>
                <p class="card-text">
                  <!-- Troncamento descrizione -->
                  <c:choose>
                    <c:when test="${fn:length(w.film.descrizione) > 120}">
                      ${fn:substring(w.film.descrizione, 0, 120)}...
                    </c:when>
                    <c:otherwise>
                      ${w.film.descrizione}
                    </c:otherwise>
                  </c:choose>
                </p>
                <a href="DettaglioFilmServlet?id=${w.film.id}"
                   class="btn btn-primary">Dettaglio Film</a>

                <!-- Link Rimuovi dalla watchlist -->
                <a href="RimuoviWatchlistServlet?filmId=${w.film.id}"
                   class="btn btn-danger"
                   onclick="return confirm('Sei sicuro di voler rimuovere questo film dalla tua watchlist?');">
                  Rimuovi
                </a>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:otherwise>
  </c:choose>
</div>

<%@ include file="../componenti/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
