<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../componenti/navbar.jsp" %>
<%
  String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<head>
  <title>Acquisto confermato</title>
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

<div class="container my-5 text-center">
  <h2>Grazie per il tuo acquisto!</h2>
  <p>Riceverai una conferma via email con tutti i dettagli.</p>
  <a href="HomeServlet" class="btn btn-outline-light mt-3">Torna alla Home</a>
</div>

<%@ include file="../componenti/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
