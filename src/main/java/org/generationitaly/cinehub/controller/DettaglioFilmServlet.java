package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import org.generationitaly.cinehub.entity.Film;
import org.generationitaly.cinehub.entity.Giudizio;
import org.generationitaly.cinehub.entity.Utente;
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

        Film film = filmRepository.findById(id);
        if (film == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Film non trovato");
            return;
        }

        // ✅ Conversione YouTube "watch?v=" → "embed/"
        if (film.getLinkTrailer() != null && film.getLinkTrailer().contains("watch?v=")) {
            String embedLink = film.getLinkTrailer().replace("watch?v=", "embed/");
            // Rimuove eventuali parametri successivi (es: &pp=...)
            int andIndex = embedLink.indexOf("&");
            if (andIndex != -1) {
                embedLink = embedLink.substring(0, andIndex);
            }
            film.setLinkTrailer(embedLink);
        }

        List<Giudizio> giudizi = giudizioRepository.findByFilm(film);

        HttpSession session = request.getSession(false);
        boolean isUtenteLoggato = (session != null && session.getAttribute("utente") != null);

        boolean haGiaCommentato = false;
        if (isUtenteLoggato) {
            Utente utente = (Utente) session.getAttribute("utente");
            Giudizio giudizio = giudizioRepository.findByUtenteAndFilm(utente, film);
            haGiaCommentato = (giudizio != null);
        }

        request.setAttribute("film", film);
        request.setAttribute("giudizi", giudizi);
        request.setAttribute("isUtenteLoggato", isUtenteLoggato);
        request.setAttribute("haGiaCommentato", haGiaCommentato);

        request.getRequestDispatcher("dettaglioFilm.jsp").forward(request, response);
    }
}
