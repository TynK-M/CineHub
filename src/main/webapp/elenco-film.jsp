<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Bootstrap demo</title>
		<!-- STILE BOOTSTRAP -->
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
			rel="stylesheet">
		<!-- CSS -->
		<link href="styles/global.css" rel="stylesheet">	
		<link href="styles/elenco-film.css" rel="stylesheet">	
		
	</head>
	<body>
		
		<!-- NAVBAR -->
	<%@include file="navbar.jsp" %> 
	<!-- inizio contenitori -->
	
	<form action="" method="get">
	
	<div class="container ">
		<div class="row">

			<!-- CONTENITORE SINISTRA UOTO -->
			<div class="col-1 "></div>
			<!-- CONTENITORE CENTRO SCHEDE FILM -->
			
			 
				<div style="padding: 20px" class="col-9 ">

					<%
					for (int i = 0; i < 9; i++) {
					%>

					<div class="card fluid carta">

						<img src="images/comingSoon.png" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-outline-light">Dettaglio film</a>

						</div>

					</div>
					<%
					}
					%>
	
			</div>
			
			
			<!-- CONTENITORE DESTRA FILTRI RICERCA -->
			<div class="col-2 " >
			

				<div class="container cont colore-scritte">

					<div class="linea-bottom">
						<h3>Filtri</h3>
					</div>


					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="flexCheckDefault"> <label class="form-check-label"
							for="flexCheckDefault"> Dal più votato</label>
					</div>

					<h5>Generi:</h5>
					<ul class="lista-filtri">
						<li>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault1"> <label
									class="form-check-label" for="flexRadioDefault1">
									Fantasy </label>
							</div>
						</li>
						<li>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault2"> <label
									class="form-check-label" for="flexRadioDefault2">
									Azione </label>
							</div>
						</li>
						<li>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault3"> <label
									class="form-check-label" for="flexRadioDefault3">
									Commedia </label>
							</div>
						</li>
						<li>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault4"> <label
									class="form-check-label" for="flexRadioDefault4">
									Giallo </label>
							</div>
						</li>
						<li>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault5"> <label
									class="form-check-label" for="flexRadioDefault5">
									Horror </label>
							</div>
						</li>
						<li>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault6"> <label
									class="form-check-label" for="flexRadioDefault6">
									Romantico </label>
							</div>
						</li>
						<li>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault7"> <label
									class="form-check-label" for="flexRadioDefault7">
									Animazione</label>
							</div>
						</li>

						<li>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault8"> <label
									class="form-check-label" for="flexRadioDefault8">
									Null</label>
							</div>
						</li>

					</ul>
				</div>
            
			</div>

		</div>
	</div>
</form>

    <!-- FOOTER -->
    <%@ include file="footer.jsp" %>

	<!-- SCRIPT -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>