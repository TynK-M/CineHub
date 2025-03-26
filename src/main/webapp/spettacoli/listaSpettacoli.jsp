<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Lista Spettacoli</title>
  <!-- Bootstrap -->
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
  <!-- Stili -->
  <link href="styles/global.css" rel="stylesheet">
  <link href="styles/index.css" rel="stylesheet">
</head>
<body class="bg-dark text-light">
<%@ include file="../componenti/navbar.jsp" %>

<div class="container my-5">
  <h2 class="mb-4 text-center">Spettacoli disponibili</h2>

  <form method="get" action="ListaSpettacoliServlet" class="row g-3 mb-4">
    <div class="col-md-5">
      <input type="text" name="titolo" class="form-control" placeholder="Cerca per titolo">
    </div>
    <div class="col-md-5">
      <input type="date" name="data" class="form-control">
    </div>
    <div class="col-md-2 d-grid">
      <button type="submit" class="btn btn-primary">Cerca</button>
    </div>
  </form>

  <c:forEach var="s" items="${spettacoli}">
    <div class="card bg-light text-dark mb-3">
      <div class="card-body">
        <h5 class="card-title">${s.film.titolo}</h5>
        <p class="card-text">
          <strong>Data:</strong> ${s.data} - <strong>Ora:</strong> ${s.orario}<br>
          <strong>Sala:</strong> ${s.sala.nome}
        </p>
        <a href="PrenotaSpettacoloServlet?id=${s.id}" class="btn btn-success">Prenota</a>
      </div>
    </div>
  </c:forEach>
</div>

<%@ include file="../componenti/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
