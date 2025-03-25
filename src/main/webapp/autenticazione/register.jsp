<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register</title>
<!-- Style Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Style global -->
<link href="../styles/global.css" rel="stylesheet">

</head>
<header>
<!-- Navbar -->
	<nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Cine Hub</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Homepage</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Film </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Nelle sale</a></li>
							<li><a class="dropdown-item" href="#">Prossimamente</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="#">Vintage</a></li>
						</ul></li>
				</ul>
				<form class="d-flex" role="search">
					<button class="btn btn-outline-success" type="submit">Accedi</button>
				</form>
			</div>
		</div>
	</nav>
</header>
<body>
	<h2>Registrati!</h2>
	<form action="" method="POST">
		<div class="form-row"></div>
		<!-- register -->
		<div class="mb-3">
			<input class="" id="input-nome" name="nome" type="text"
				placeholder="Nome"> <label
				for="input-nome"></label>
		</div>
		<div class="mb-3">
			<input class="" id="input-cognome" name="cognome"
				type="text" placeholder="Cognome" > <label
				for="input-cognome"></label>
		</div>
		<div class="mb-3">
			<input class="" id="input-data-nascita"
				name="dataNascita" type="date" placeholder="Data di nascita"
				> <label for="input-data-nascita"></label>
		</div>
		<div class="mb-3">
			<div class="form-check form-check-inline">
				<input class="form-check-input" id="input-sesso-m" name="sesso"
					value="M" type="radio"> <label class="form-check-label"
					for="input-sesso-m">M</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" id="input-sesso-f" name="sesso"
					value="F" type="radio"> <label class="form-check-label"
					for="input-sesso-f">F</label>
			</div>
		</div>
		<div class="mb-3">
			<input class="" id="input-cellulare" name="cellulare"
				type="text" placeholder="Cellulare"> <label
				for="input-cellulare"></label>
		</div>
		<div class="mb-3">
			<input class="" id="input-email" name="email"
				type="email" placeholder="Email"> <label
				for="input-email"></label>
		</div>
		<div class="mb-3">
			<input class="" id="input-password" name="password"
				type="password" placeholder="Password">
			<label for="input-pssword"></label>
		</div>
		<div class="">
			<input class="form-check-input" type="checkbox" id="TermsCheck">
			<label class="form-check-label" for="TermsCheck"> Accetto
				Termini e Condizioni* </label>
		</div>
		<div class="">
			<input class="form-check-input" type="checkbox" id="NewsletterCheck">
			<label class="form-check-label" for="NewsletterCheck"> Voglio
				iscrivermi alla newsletter </label>
		</div>
		<br>
		<button type="submit" class="btn btn-primary">Registrati</button>
	</form>
	<br>
	<p>
		Hai già un account? <a href="login.jsp">Accedi</a>
	</p>

	<script src="js/script.js"></script>
</body>
</html>