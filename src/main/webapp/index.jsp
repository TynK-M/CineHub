<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Homepage</title>
<!-- Style Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Style global -->
<link href="styles/global.css" rel="stylesheet">
<!-- Style index -->
<link href="styles/index.css" rel="stylesheet">
</head>

<body>

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

	<!-- Intestazione -->
	<div class="intestazione">
		<h2>Prossimamente in uscita</h2>
	</div>

	<!-- Carosello -->
	<div id="carosello" style="padding-bottom: 15px">
		<div id="carouselExampleIndicators" class="carousel slide">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="images/dark-knight-rises-movie-poster-banner-catwoman.jpg"
						class="d-block w-100" alt="..."
						style="width: 100% !important; max-height: 350px !important;">
				</div>
				<div class="carousel-item">
					<img src="images/mark-wahlberg-mark-wahlberg-john-ted.jpg"
						class="d-block w-100" alt="..."
						style="width: 100% !important; max-height: 350px !important;">
				</div>
				<div class="carousel-item">
					<img src="images/the-big-lebowski-movie-poster.jpg"
						class="d-block w-100" alt="..."
						style="width: 100% !important; max-height: 350px !important;">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	
	<!-- Scegli il film -->
	<div class="intestazione">
		<h2>Scegli il film</h2>
	</div>

	<!-- Film -->
	<!-- Gallery -->
	<div id="galleria-film" class="row">
		<div class="col-lg-4 col-md-12 mb-4 mb-lg-0">
			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4" alt="Boat on Calm Water" />

			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4"
				alt="Wintry Mountain Landscape" />
		</div>

		<div class="col-lg-4 mb-4 mb-lg-0">
			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4"
				alt="Mountains in the Clouds" /> <img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4" alt="Boat on Calm Water" />
		</div>

		<div class="col-lg-4 mb-4 mb-lg-0">
			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4" alt="Waves at Sea" />

			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4"
				alt="Yosemite National Park" />
		</div>
		
		<div class="col-lg-4 mb-4 mb-lg-0">
			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4" alt="Waves at Sea" />

			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4"
				alt="Yosemite National Park" />
		</div>
		
		<div class="col-lg-4 mb-4 mb-lg-0">
			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4" alt="Waves at Sea" />

			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4"
				alt="Yosemite National Park" />
		</div>
		
		<div class="col-lg-4 mb-4 mb-lg-0">
			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4" alt="Waves at Sea" />

			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4"
				alt="Yosemite National Park" />
		</div>
		
		<div class="col-lg-4 mb-4 mb-lg-0">
			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4" alt="Waves at Sea" />

			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4"
				alt="Yosemite National Park" />
		</div>
		
		<div class="col-lg-4 mb-4 mb-lg-0">
			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4" alt="Waves at Sea" />

			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4"
				alt="Yosemite National Park" />
		</div>
		
		<div class="col-lg-4 mb-4 mb-lg-0">
			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4" alt="Waves at Sea" />

			<img
				src="https://www.place-hold.it/500x300"
				class="w-100 shadow-1-strong rounded mb-4"
				alt="Yosemite National Park" />
		</div>
	</div>
	<!-- Gallery -->

	<!-- Footer -->
	<footer class="text-center text-lg-start bg-dark text-muted"
		data-bs-theme="dark">
		<!-- Section: Social media -->
		<section
			class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
			<!-- Left -->
			<div class="me-5 d-none d-lg-block">
				<span>Connettiti con noi sui nostri social network:</span>
			</div>
			<!-- Left -->

			<!-- Right -->
			<div class="social-icons">
				<a href="https://www.facebook.com/" class="me-4 text-reset"> <img
					src="images/social-icons/facebook.png" alt="Facebook"
					class="social-icon">
				</a> <a href="https://x.com/" class="me-4 text-reset"> <img
					src="images/social-icons/twitter.png" alt="Twitter"
					class="social-icon">
				</a> <a href="https://instagram.com/" class="me-4 text-reset"> <img
					src="images/social-icons/instagram.png" alt="Instagram"
					class="social-icon">
				</a> <a href="https://tiktok.com" class="me-4 text-reset"> <img
					src="images/social-icons/tik-tok.png" alt="TikTok"
					class="social-icon">
				</a>
			</div>

			<!-- Right -->
		</section>
		<!-- Section: Social media -->

		<!-- Section: Links  -->
		<section class="">
			<div class="container text-center text-md-start mt-5">
				<!-- Grid row -->
				<div class="row mt-3">
					<!-- Grid column -->
					<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
						<!-- Content -->
						<h6 class="text-uppercase fw-bold mb-4">
							<i class="fas fa-gem me-3"></i>Cine Hub
						</h6>
						<p>Una piccola realtà che si concentra sul migliorare la
							vostra esperienza cinematografica.</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Contatti</h6>
						<p>
							<i class="fas fa-home me-3"></i> Napoli, NA 80056, IT
						</p>
						<p>
							<i class="fas fa-envelope me-3"></i> cinehub@gmail.com
						</p>
						<p>
							<i class="fas fa-phone me-3"></i> + 39 123 456 7890
						</p>
						<p>
							<i class="fas fa-print me-3"></i> + 39 123 456 7890
						</p>
					</div>
					<!-- Grid column -->
				</div>
				<!-- Grid row -->
			</div>
		</section>
		<!-- Section: Links  -->

		<!-- Copyright -->
		<div class="text-center p-4"
			style="background-color: rgba(0, 0, 0, 0.05);">
			© 2025 Copyright: <a class="text-reset fw-bold"
				href="https://cinehub/">Cine Hub</a>
		</div>
		<!-- Copyright -->
	</footer>
	<!-- Footer -->

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>