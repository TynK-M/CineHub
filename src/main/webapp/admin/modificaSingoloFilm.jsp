<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../componenti/navbar.jsp" %>
<%
  String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <title>Modifica Singolo Film</title>
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
  <h2 class="mb-4">Modifica Film</h2>
  <form action="<%= basePath %>/ModificaSingoloFilmServlet" method="post">
    <input type="hidden" name="id" value="${film.id}">

    <div class="mb-3">
      <label class="form-label">Titolo</label>
      <input type="text" name="titolo" class="form-control" value="${film.titolo}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Descrizione</label>
      <textarea name="descrizione" class="form-control" rows="4" required>${film.descrizione}</textarea>
    </div>

    <div class="mb-3">
      <label class="form-label">Link Trailer</label>
      <input type="text" name="linkTrailer" class="form-control" value="${film.linkTrailer}">
    </div>

    <div class="mb-3">
      <label class="form-label">Durata (minuti)</label>
      <input type="number" name="durata" class="form-control" value="${film.durata}">
    </div>

    <div class="mb-3">
      <label class="form-label">Data Uscita</label>
      <input type="date" name="dataUscita" class="form-control" value="${film.dataUscita}">
    </div>

    <div class="mb-3">
      <label class="form-label">Locandina (URL)</label>
      <input type="text" name="locandina" class="form-control" value="${film.locandina}">
    </div>

    <div class="mb-3">
      <label class="form-label">Genere</label>
      <select name="genereId" class="form-select" required>
        <c:forEach var="genere" items="${generi}">
          <option value="${genere.id}" ${genere.id == film.genere.id ? "selected" : ""}>
              ${genere.nome}
          </option>
        </c:forEach>
      </select>
    </div>


    <div class="mb-3">
      <label class="form-label">Nazione</label>
      <select name="nazioneId" class="form-select" required>
        <c:forEach var="nazione" items="${nazioni}">
          <option value="${nazione.id}" ${nazione.id == film.nazione.id ? "selected" : ""}>
              ${nazione.nome}
          </option>
        </c:forEach>
      </select>
    </div>

    <div class="form-check form-switch mb-3">
      <input class="form-check-input" type="checkbox" name="vintage" <c:if test="${film.vintage}">checked</c:if>>
      <label class="form-check-label">Vintage</label>
    </div>

    <div class="form-check form-switch mb-4">
      <input class="form-check-input" type="checkbox" name="checkUscita" <c:if test="${film.checkUscita}">checked</c:if>>
      <label class="form-check-label">Film in uscita</label>
    </div>

    <button type="submit" class="btn btn-warning">Salva modifiche</button>
    <a href="<%= basePath %>/ModificaFilmServlet" class="btn btn-secondary ms-2">Annulla</a>
  </form>
</div>

<%@ include file="../componenti/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>