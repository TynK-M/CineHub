<nav class="navbar navbar-expand-lg bg-dark navbar-dark" data-bs-theme="dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="HomeServlet">Cine Hub</a>
		<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- Menu di navigazione -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link" href="HomeServlet">Home</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
						Film
					</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Nelle sale</a></li>
						<li><a class="dropdown-item" href="#">Prossimamente</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">Vintage</a></li>
					</ul>
				</li>
			</ul>

			<!-- Sezione utente -->
			<ul class="navbar-nav mb-2 mb-lg-0">
				<c:choose>
					<c:when test="${not empty sessionScope.utente}">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
							   data-bs-toggle="dropdown" aria-expanded="false">
								Ciao, ${sessionScope.utente.nome}!
							</a>
							<ul class="dropdown-menu dropdown-menu-end dropdown-menu-dark" aria-labelledby="userDropdown">
								<li><a class="dropdown-item" href="ProfiloServlet">Profilo</a></li>
								<li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item">
							<a class="btn btn-outline-success me-2" href="autenticazione/login.jsp">Accedi</a>
						</li>
						<li class="nav-item">
							<a class="btn btn-outline-primary" href="autenticazione/register.jsp">Registrati</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
