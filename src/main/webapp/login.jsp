<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <!-- Style Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Style global -->
    <link href="styles/global.css" rel="stylesheet">
    <!-- Style index -->
    <link href="styles/index.css" rel="stylesheet">
</head>
<body>
<h2>Login</h2>
		<% 
		String errore = request.getParameter("errore");
		%>
		<form action="login" method="post">
			<div class="form-floating mb-3">
					<input class="form-control" id="input-email" name="email" type="email" placeholder="Email" style="width: 200px; ">
					<label for="input-email"></label>	
				</div>
				<div class="form-floating mb-3">
					<input class="form-control" id="input-password" name="password" type="password" placeholder="Password" style="width: 200px; ">
					<label for="input-pssword"></label>	
				</div>
			
			<button type="submit">LOGIN</button><%  
			if (errore != null) {
			%>
			<%-- <span class="error"><%= errore %></span> --%>
			<span class="error">Oops...credenziali errate!</span>
			<% } %>
		</form>	
    <p>Non hai un account? <a href="register.html">Registrati</a></p>

    <script src="js/script.js"></script>
</body>
</html>