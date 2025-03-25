<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <title>Profilo di ${utenteProfilo.nome}</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="styles/global.css" rel="stylesheet">
</head>
<body class="bg-dark text-light">

<%@ include file="componenti/navbar.jsp" %>

<div class="container my-5">
  <div class="text-center mb-4">
    <img src="${empty utenteProfilo.fotoProfilo ? 'images/default-user.png' : utenteProfilo.fotoProfilo}"
         alt="Foto profilo"
         class="rounded-circle shadow" width="120" height="120">
    <h2 class="mt-3">${utenteProfilo.nome} ${utenteProfilo.cognome}</h2>
    <p class="text-muted">Email: ${utenteProfilo.email}</p>
  </div>

  <c:choose>
    <c:when test="${sessionScope.utente.id == utenteProfilo.id}">
      <div class="accordion" id="accordionProfilo">

        <!-- Modifica dati -->
        <div class="accordion-item">
          <h2 class="accordion-header" id="headingInfo">
            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseInfo">
              Modifica i tuoi dati
            </button>
          </h2>
          <div id="collapseInfo" class="accordion-collapse collapse show">
            <div class="accordion-body bg-light text-dark">
              <form action="ModificaUtenteServlet" method="post">
                <input type="hidden" name="id" value="${utenteProfilo.id}">

                <div class="mb-3">
                  <label>Email:</label>
                  <input type="email" class="form-control" name="email" value="${utenteProfilo.email}" required>
                </div>

                <div class="mb-3">
                  <label>Nuova Password:</label>
                  <input type="password" class="form-control" name="password" placeholder="Lascia vuoto per non cambiare">
                </div>

                <div class="mb-3">
                  <label>URL Foto Profilo:</label>
                  <input type="text" class="form-control" name="fotoProfilo" value="${utenteProfilo.fotoProfilo}">
                </div>

                <button type="submit" class="btn btn-primary">Salva modifiche</button>
              </form>
            </div>
          </div>
        </div>

        <!-- Commenti -->
        <div class="accordion-item">
          <h2 class="accordion-header" id="headingGiudizi">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseGiudizi">
              I miei commenti sui film
            </button>
          </h2>
          <div id="collapseGiudizi" class="accordion-collapse collapse">
            <div class="accordion-body bg-light text-dark">
              <c:if test="${empty giudiziUtente}">
                <p>Non hai ancora lasciato commenti.</p>
              </c:if>
              <c:forEach var="g" items="${giudiziUtente}">
                <div class="mb-3 border-bottom pb-2">
                  <strong>Film:</strong> <a href="DettaglioFilmServlet?id=${g.film.id}">${g.film.titolo}</a><br>
                  <strong>Stelle:</strong> ${g.stelle} ⭐<br>
                  <em>${g.commento}</em>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </c:when>

    <c:otherwise>
      <div class="card bg-light text-dark">
        <div class="card-header">Commenti pubblici</div>
        <div class="card-body">
          <c:if test="${empty giudiziUtente}">
            <p>L'utente non ha ancora lasciato commenti pubblici.</p>
          </c:if>
          <c:forEach var="g" items="${giudiziUtente}">
            <div class="mb-3 border-bottom pb-2">
              <strong>Film:</strong> <a href="DettaglioFilmServlet?id=${g.film.id}">${g.film.titolo}</a><br>
              <strong>Stelle:</strong> ${g.stelle} ⭐<br>
              <em>${g.commento}</em>
            </div>
          </c:forEach>
        </div>
      </div>
    </c:otherwise>
  </c:choose>
</div>

<%@ include file="componenti/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
