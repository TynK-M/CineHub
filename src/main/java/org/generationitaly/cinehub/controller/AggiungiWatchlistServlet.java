package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

import org.generationitaly.cinehub.entity.Film;
import org.generationitaly.cinehub.entity.Utente;
import org.generationitaly.cinehub.entity.Watchlist;
import org.generationitaly.cinehub.repository.FilmRepository;
import org.generationitaly.cinehub.repository.WatchlistRepository;

@WebServlet("/AggiungiWatchlistServlet")
public class AggiungiWatchlistServlet extends HttpServlet {

    private final FilmRepository filmRepo = new FilmRepository();
    private final WatchlistRepository watchRepo = new WatchlistRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Verifica login
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("utente") == null) {
            res.sendRedirect("autenticazione/login.jsp");
            return;
        }
        Utente utente = (Utente) session.getAttribute("utente");

        // Leggi param filmId
        String filmIdParam = req.getParameter("filmId");
        if (filmIdParam == null || filmIdParam.isEmpty()) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Param filmId mancante");
            return;
        }
        int filmId = Integer.parseInt(filmIdParam);

        // Verifica se film esiste
        Film film = filmRepo.findById(filmId);
        if (film == null) {
            res.sendError(HttpServletResponse.SC_NOT_FOUND, "Film non trovato");
            return;
        }

        // Controlla se già in watchlist
        Watchlist w = watchRepo.findByUtenteAndFilm(utente.getId(), filmId);
        if (w == null) {
            // Se non presente, salviamo
            Watchlist nuovo = new Watchlist();
            nuovo.setUtente(utente);
            nuovo.setFilm(film);
            watchRepo.save(nuovo);
        }

        // Alla fine redirect al dettaglio film, o a una pagina
        res.sendRedirect("WatchlistServlet");
    }
}
