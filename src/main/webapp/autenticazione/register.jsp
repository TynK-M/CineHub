<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Registrazione</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/styles/global.css"
	rel="stylesheet">
	<link href="../styles/login.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../componenti/navbar.jsp"%>

	<div class="container mt-5">
		<div class="header">
			<h2 class="mb-4">Registrati su CineHub</h2>
		</div>
		<!-- Mostra messaggio di errore se già registrato -->
		<c:if test="${not empty erroreRegistrazione}">
			<div class="alert alert-danger">${erroreRegistrazione}</div>
		</c:if>

		<form action="${pageContext.request.contextPath}/RegistrazioneServlet"
			method="post">
			<div class="mb-3">
				<input class="form-control" name="nome" type="text"
					placeholder="Nome" required>
			</div>
			<div class="mb-3">
				<input class="form-control" name="cognome" type="text"
					placeholder="Cognome" required>
			</div>
			<div class="mb-3">
				<input class="form-control" name="email" type="email"
					placeholder="Email" required>
			</div>
			<div class="mb-3">
				<input class="form-control" name="password" type="password"
					placeholder="Password" required>
			</div>
			<div class="form-check mb-3">
				<input class="form-check-input" type="checkbox" name="newsletter"
					id="newsletter"> <label class="form-check-label"
					for="newsletter">Iscriviti alla newsletter</label>
			</div>
			<button type="submit" class="btn btn-success">Registrati</button>
		</form>

		<p class="mt-3">
			Hai già un account? <a
				href="${pageContext.request.contextPath}/autenticazione/login.jsp">Accedi</a>
		</p>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
