<nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="HomeServlet">Cine Hub</a>
		<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="HomeServlet">Homepage</a></li>
				<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Film </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Nelle sale</a></li>
						<li><a class="dropdown-item" href="#">Prossimamente</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">Vintage</a></li>
					</ul>
				</li>
			</ul>

			<%-- Mostra pulsanti diversi se l'utente è loggato --%>
			<c:choose>
				<c:when test="${not empty sessionScope.utente}">
		<span class="navbar-text me-3 text-light">
			Ciao, ${sessionScope.utente.nome}!
		</span>
					<form class="d-flex" action="${pageContext.request.contextPath}/LogoutServlet" method="get">
						<button class="btn btn-outline-danger" type="submit">Logout</button>
					</form>
				</c:when>
				<c:otherwise>
					<form class="d-flex me-2" action="${pageContext.request.contextPath}/autenticazione/login.jsp" method="get">
						<button class="btn btn-outline-success" type="submit">Accedi</button>
					</form>
					<form class="d-flex" action="${pageContext.request.contextPath}/autenticazione/register.jsp" method="get">
						<button class="btn btn-outline-primary" type="submit">Registrati</button>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</nav>
