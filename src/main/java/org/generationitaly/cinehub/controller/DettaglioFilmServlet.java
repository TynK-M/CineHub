package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import org.generationitaly.cinehub.entity.Film;
import org.generationitaly.cinehub.entity.Giudizio;
import org.generationitaly.cinehub.repository.FilmRepository;
import org.generationitaly.cinehub.repository.GiudizioRepository;

@WebServlet("/DettaglioFilmServlet")
public class DettaglioFilmServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final FilmRepository filmRepository = new FilmRepository();
    private final GiudizioRepository giudizioRepository = new GiudizioRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Recupera l'id del film dai parametri
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID film mancante");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID film non valido");
            return;
        }

        // Recupera il film
        Film film = filmRepository.findById(id);
        if (film == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Film non trovato");
            return;
        }

        // Recupera i giudizi relativi a questo film
        List<Giudizio> giudizi = giudizioRepository.findByFilm(film);

        // Controlla se c'è un utente loggato
        HttpSession session = request.getSession(false);
        boolean isUtenteLoggato = (session != null && session.getAttribute("utente") != null);

        // Passa i dati alla JSP
        request.setAttribute("film", film);
        request.setAttribute("giudizi", giudizi);
        request.setAttribute("isUtenteLoggato", isUtenteLoggato);

        // Forward alla pagina di dettaglio
        request.getRequestDispatcher("dettaglioFilm.jsp").forward(request, response);
    }
}
