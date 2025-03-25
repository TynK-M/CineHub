<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
  <title>Acquisto confermato</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-light">
<%@ include file="../componenti/navbar.jsp" %>

<div class="container my-5 text-center">
  <h2>Grazie per il tuo acquisto!</h2>
  <p>Riceverai una conferma via email con tutti i dettagli.</p>
  <a href="HomeServlet" class="btn btn-outline-light mt-3">Torna alla Home</a>
</div>

<%@ include file="../componenti/footer.jsp" %>
</body>
</html>
