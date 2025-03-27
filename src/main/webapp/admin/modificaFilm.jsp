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
  <title>Modifica Film</title>
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Stili -->
  <link href="styles/global.css" rel="stylesheet">
  <link href="styles/index.css" rel="stylesheet">
  <link href="styles/global.css" rel="stylesheet">
</head>
<body class="bg-dark text-light">

<div class="container mt-5">
  <h2 class="mb-4">Lista Film</h2>
  <table class="table table-dark table-striped">
    <thead>
    <tr>
      <th>Titolo</th>
      <th>Genere</th>
      <th>Nazione</th>
      <th>Azioni</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="film" items="${films}">
      <tr>
        <td>${film.titolo}</td>
        <td>${film.genere}</td>
        <td>${film.nazione}</td>
        <td class="d-flex gap-2">
          <!-- Bottone Modifica -->
          <a href="<%= basePath %>/ModificaSingoloFilmServlet?id=${film.id}" class="btn btn-warning">Modifica</a>

          <!-- Bottone Elimina -->
          <form action="<%= basePath %>/EliminaFilmServlet" method="post" onsubmit="return confirm('Sei sicuro di voler eliminare questo film?');">
            <input type="hidden" name="id" value="${film.id}">
            <button type="submit" class="btn btn-danger btn-sm">Elimina</button>
          </form>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<jsp:include page="/componenti/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
