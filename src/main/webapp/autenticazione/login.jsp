<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="../styles/global.css" rel="stylesheet">
</head>
<body>
<%@ include file="../componenti/navbar.jsp" %>

<div class="container mt-5">
	<h2 class="mb-4">Accedi a CineHub</h2>

	<form action="${pageContext.request.contextPath}/LoginServlet" method="post">
	<div class="mb-3">
			<input class="form-control" name="email" type="email" placeholder="Email" required>
		</div>
		<div class="mb-3">
			<input class="form-control" name="password" type="password" placeholder="Password" required>
		</div>
		<button type="submit" class="btn btn-primary">Login</button>
		<c:if test="${not empty erroreLogin}">
			<p class="text-danger mt-2">${erroreLogin}</p>
		</c:if>
	</form>

	<p class="mt-3">Non hai un account? <a href="register.jsp">Registrati</a></p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>