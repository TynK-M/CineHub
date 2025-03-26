<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login - CineHub</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="../styles/global.css" rel="stylesheet">
	<link href="../styles/login.css" rel="stylesheet">
</head>
<body>

<!-- Navbar inclusa direttamente nella pagina di login -->
<nav class="navbar navbar-expand-lg bg-dark navbar-dark" data-bs-theme="dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/HomeServlet">CineHub</a>
		<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse"
				data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent"
				aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	</div>
</nav>

<!-- Form di login -->
<div class="container mt-5 login-form">
	<div class="header">
		<h2 class="mb-4">Accedi a CineHub</h2>
	</div>
	<form action="${pageContext.request.contextPath}/LoginServlet" method="post">
		<div class="mb-3">
			<label for="email" class="form-label">Email</label>
			<input id="email" class="form-control" name="email" type="email" placeholder="Inserisci la tua email" required>
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">Password</label>
			<input id="password" class="form-control" name="password" type="password" placeholder="Inserisci la tua password" required>
		</div>
		<button type="submit" class="btn btn-primary w-100">Login</button>

		<c:if test="${not empty erroreLogin}">
			<p class="text-danger mt-2">${erroreLogin}</p>
		</c:if>
	</form>
	<div class="register">
		<p class="mt-3">
			Non hai un account? <a href="register.jsp">Registrati</a>
		</p>
	</div>
</div>

<!-- Footer -->
<%@ include file="../componenti/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
