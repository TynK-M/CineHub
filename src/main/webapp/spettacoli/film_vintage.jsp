<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <title>CineHub</title>
  <!-- Bootstrap -->
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
  <!-- Stili -->
</head>
<body class="bg-dark text-light">

<!-- Includi la navbar, se vuoi la stessa di tutto il sito -->
<%@ include file="../componenti/navbar.jsp" %>

<div class="container mt-5">
  <h2 class="text-center mb-4">Film Riposti</h2>

  <c:if test="${empty filmVintage}">
    <p class="text-center">Nessun film vintage trovato.</p>
  </c:if>

  <c:forEach var="film" items="${filmVintage}">
    <div class="card bg-light text-dark mb-3">
      <div class="card-body">
        <h5 class="card-title">${film.titolo}</h5>
        <a href="DettaglioFilmServlet?id=${film.id}" class="btn btn-outline-warning me-2">Dettagli</a>
      </div>
    </div>
  </c:forEach>
</div>

<!-- Footer se presente -->
<%@ include file="../componenti/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
