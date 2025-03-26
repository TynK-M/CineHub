package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import org.generationitaly.cinehub.entity.Utente;
import org.generationitaly.cinehub.entity.Watchlist;
import org.generationitaly.cinehub.repository.WatchlistRepository;
@WebServlet("/RimuoviWatchlistServlet")
public class RimuoviWatchlistServlet extends HttpServlet {
    private final WatchlistRepository watchRepo = new WatchlistRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("utente") == null) {
            res.sendRedirect("login.jsp");
            return;
        }
        Utente utente = (Utente) session.getAttribute("utente");

        String filmIdParam = req.getParameter("filmId");
        if (filmIdParam == null || filmIdParam.isEmpty()) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametro filmId mancante");
            return;
        }

        int filmId = Integer.parseInt(filmIdParam);

        // Trova l'elemento watchlist
        Watchlist watch = watchRepo.findByUtenteAndFilm(utente.getId(), filmId);
        if (watch == null) {
            // Non trovato => non fare nulla o errore
            res.sendRedirect("WatchlistServlet");
            return;
        }

        // Se esiste, rimuovi
        watchRepo.delete(watch);

        // Torna alla lista watchlist
        res.sendRedirect("WatchlistServlet");
    }
}
