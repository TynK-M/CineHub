<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Homepage</title>
	<!-- Style Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Style global -->
	<link href="styles/global.css" rel="stylesheet">
	<!-- Style index -->
	<link href="styles/index.css" rel="stylesheet">
</head>

<body>

<!-- NAVBAR -->
<%@include file="componenti/navbar.jsp" %>

<c:if test="${not empty sessionScope.utente}">
	<div class="alert alert-success text-center m-0 rounded-0">
		Benvenuto, <strong>${sessionScope.utente.nome}</strong>!
	</div>
</c:if>

<!-- Intestazione -->
<div class="intestazione">
	<h2>Prossimamente in uscita</h2>
</div>

<!-- Carosello -->
<div id="carosello" style="padding-bottom: 15px">
	<div id="carouselExampleIndicators" class="carousel slide">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
					aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
					aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
					aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/dark-knight-rises-movie-poster-banner-catwoman.jpg"
					 class="d-block w-100" alt="..." style="width: 100%; max-height: 350px;">
			</div>
			<div class="carousel-item">
				<img src="images/mark-wahlberg-mark-wahlberg-john-ted.jpg"
					 class="d-block w-100" alt="..." style="width: 100%; max-height: 350px;">
			</div>
			<div class="carousel-item">
				<img src="images/the-big-lebowski-movie-poster.jpg"
					 class="d-block w-100" alt="..." style="width: 100%; max-height: 350px;">
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Precedente</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Successivo</span>
		</button>
	</div>
</div>

<!-- Scegli il film -->
<div class="intestazione">
	<h2>Scegli il film</h2>
</div>

<!-- Film dinamici -->
<div class="container">
	<div class="row">
		<c:forEach var="film" items="${filmList}">
			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100 shadow-sm">
					<img src="https://www.place-hold.it/500x300"
						 class="card-img-top"
						 alt="${film.titolo}" style="height: 250px; object-fit: cover;">
					<div class="card-body">
						<h5 class="card-title">${film.titolo}</h5>
						<p class="card-text">
							<c:choose>
								<c:when test="${fn:length(film.descrizione) > 120}">
									${fn:substring(film.descrizione, 0, 120)}...
								</c:when>
								<c:otherwise>
									${film.descrizione}
								</c:otherwise>
							</c:choose>
						</p>
						<a href="DettaglioFilmServlet?id=${film.id}" class="btn btn-primary">Scopri di più</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<!-- FOOTER -->
<%@ include file="componenti/footer.jsp" %>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
