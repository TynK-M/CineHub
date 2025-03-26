<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>I miei acquisti</title>
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

<div class="container mt-5">
  <h2 class="mb-4 text-center">I tuoi acquisti</h2>

  <c:choose>
    <c:when test="${empty acquisti}">
      <p class="text-center">Nessun acquisto trovato.</p>
    </c:when>
    <c:otherwise>
      <table class="table table-dark table-striped">
        <thead>
        <tr>
          <th>Film</th>
          <th>Data e Ora</th>
          <th>Azioni</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="ac" items="${acquisti}">
          <tr>
            <td>${ac.spettacolo.film.titolo}</td>
            <td>${ac.spettacolo.data} - ${ac.spettacolo.orario}</td>
            <td>
              <!-- Link a ModificaAcquistoServlet -->
              <a href="ModificaAcquistoServlet?id=${ac.id}" class="btn btn-warning">
                Modifica
              </a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:otherwise>
  </c:choose>
</div>

<%@ include file="../componenti/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
