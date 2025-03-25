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

			<!-- NAVBAR -->
	<%@include file="navbar.jsp" %> 

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
	 <%@ include file="footer.jsp" %>
	<!-- Footer -->

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>