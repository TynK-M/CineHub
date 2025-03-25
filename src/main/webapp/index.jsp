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

<!-- Carosello dinamico dei film in uscita -->
<div id="carosello" class="carousel slide mb-5" data-bs-ride="carousel">
	<div class="carousel-inner">
		<c:forEach var="film" items="${filmUscita}" varStatus="status">
			<div class="carousel-item ${status.first ? 'active' : ''}">
				<a href="DettaglioFilmServlet?id=${film.id}">
					<img src="${film.locandina}" class="d-block w-100" alt="${film.titolo}"
						 style="max-height: 600px; object-fit: cover;">
				</a>
				<div class="bg-dark text-light text-center py-3">
					<h4 class="m-0">
						<a href="DettaglioFilmServlet?id=${film.id}" class="text-light text-decoration-none">
								${film.titolo}
						</a>
					</h4>
				</div>
			</div>
		</c:forEach>
	</div>
	<button class="carousel-control-prev" type="button" data-bs-target="#carosello" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Precedente</span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#carosello" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Successivo</span>
	</button>
</div>


<!-- Scegli il film -->
<div class="intestazione">
	<h2>Scegli il film</h2>
</div>

<!-- Filtro -->
<div class="container mb-4">
	<form method="get" action="HomeServlet" class="row g-3 align-items-end">
		<div class="col-md-4">
			<label for="genere" class="form-label">Genere</label>
			<select name="genere" id="genere" class="form-select">
				<option value="">Tutti</option>
				<c:forEach var="g" items="${generi}">
					<option value="${g}" ${g == genereSelezionato ? "selected" : ""}>${g}</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-md-4">
			<label for="nazione" class="form-label">Nazione</label>
			<select name="nazione" id="nazione" class="form-select">
				<option value="">Tutte</option>
				<c:forEach var="n" items="${nazioni}">
					<option value="${n}" ${n == nazioneSelezionata ? "selected" : ""}>${n}</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-md-4">
			<button type="submit" class="btn btn-primary">Filtra</button>
			<a href="HomeServlet" class="btn btn-secondary">Reset</a>
		</div>
	</form>
</div>


<!-- Film dinamici -->
<div class="container">
	<div class="row">
		<c:forEach var="film" items="${filmList}">
			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100 shadow-sm">
					<img src="${film.locandina}" class="card-img-top"
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
