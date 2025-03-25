package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDateTime;

import org.generationitaly.cinehub.entity.*;
import org.generationitaly.cinehub.repository.*;

@WebServlet("/CommentoServlet")
public class CommentoServlet extends HttpServlet {

    private final FilmRepository filmRepo = new FilmRepository();
    private final GiudizioRepository giudizioRepo = new GiudizioRepository();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Utente utente = (Utente) session.getAttribute("utente");

        if (utente == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int filmId = Integer.parseInt(request.getParameter("filmId"));
        int stelle = Integer.parseInt(request.getParameter("stelle"));
        String commento = request.getParameter("commento");

        Film film = filmRepo.findById(filmId);

        // Controllo se esiste già una recensione dello stesso utente per lo stesso film
        Giudizio esistente = giudizioRepo.findByUtenteAndFilm(utente, film);
        if (esistente != null) {
            // puoi mostrare un messaggio di errore o fare redirect
            response.sendRedirect("DettaglioFilmServlet?id=" + filmId + "&errore=già_recensito");
            return;
        }

        Giudizio giudizio = new Giudizio();
        giudizio.setUtente(utente);
        giudizio.setFilm(film);
        giudizio.setStelle(stelle);
        giudizio.setCommento(commento);
        giudizio.setDataGiudizio(LocalDateTime.now());

        giudizioRepo.save(giudizio);
        response.sendRedirect("DettaglioFilmServlet?id=" + filmId);
    }
}
