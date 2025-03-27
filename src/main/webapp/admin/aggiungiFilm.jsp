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
  <title>Aggiungi Film</title>
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
  <h2 class="mb-4">Aggiungi Nuovo Film</h2>
  <form action="<%= basePath %>/AggiungiFilmServlet" method="post">
    <div class="mb-3">
      <label class="form-label">Titolo</label>
      <input type="text" name="titolo" class="form-control" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Descrizione</label>
      <textarea name="descrizione" class="form-control" rows="4" required></textarea>
    </div>
    <div class="mb-3">
      <label class="form-label">Link Trailer</label>
      <input type="text" name="linkTrailer" class="form-control">
    </div>
    <div class="mb-3">
      <label class="form-label">Durata</label>
      <input type="number" name="durata" class="form-control">
    </div>
    <div class="mb-3">
      <label class="form-label">Data Uscita</label>
      <input type="date" name="dataUscita" class="form-control">
    </div>
    <div class="mb-3">
      <label class="form-label">Locandina (link immagine)</label>
      <input type="text" name="locandina" class="form-control">
    </div>
    <div class="mb-3">
      <label class="form-label">Genere</label>
      <input type="text" name="genere" class="form-control">
    </div>
    <div class="mb-3">
      <label class="form-label">Nazione</label>
      <input type="text" name="nazione" class="form-control">
    </div>
    <div class="form-check form-switch mb-3">
      <input class="form-check-input" type="checkbox" name="vintage">
      <label class="form-check-label">Vintage</label>
    </div>
    <div class="form-check form-switch mb-4">
      <input class="form-check-input" type="checkbox" name="checkUscita">
      <label class="form-check-label">Film in uscita</label>
    </div>
    <button type="submit" class="btn btn-success">Aggiungi Film</button>
  </form>
</div>

<%@ include file="../componenti/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>