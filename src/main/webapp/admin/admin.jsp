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
    <title>Area Admin</title>
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
    <h2 class="text-center mb-4">Pannello di Amministrazione</h2>
    <div class="d-flex justify-content-center gap-4">
        <a href="<%= basePath %>/ModificaFilmServlet" class="btn btn-primary btn-lg">Modifica Film</a>
        <a href="<%= basePath %>/AggiungiFilmServlet" class="btn btn-success btn-lg">Aggiungi Film</a>
    </div>
</div>

<%@ include file="../componenti/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
