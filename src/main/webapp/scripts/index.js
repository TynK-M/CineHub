document.addEventListener("DOMContentLoaded", function() {
	let carousel = document.getElementById("carosello");
	let filmTitle = document.getElementById("film-title");

	function updateFilmText() {
		let activeItem = carousel
			.querySelector(".carousel-item.active");
		if (activeItem) {
			filmTitle.textContent = activeItem
				.getAttribute("data-title");
			filmTitle.href = activeItem.getAttribute("data-link");
		}
	}

	// Aggiorna il testo all'avvio
	updateFilmText();

	// Aggiorna il testo a ogni cambio di slide
	carousel.addEventListener("slid.bs.carousel", updateFilmText);
});