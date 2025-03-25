package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import org.generationitaly.cinehub.entity.Film;
import org.generationitaly.cinehub.entity.Giudizio;
import org.generationitaly.cinehub.repository.FilmRepository;
import org.generationitaly.cinehub.repository.GiudizioRepository;

@WebServlet("/DettaglioFilmServlet")
public class DettaglioFilmServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private FilmRepository filmRepository = new FilmRepository();
    private GiudizioRepository giudizioRepository = new GiudizioRepository();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
      
        String filmIdParam = request.getParameter("id");
        if (filmIdParam == null || filmIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID film mancante");
            return;
        }
        
        int filmId;
        try {
            filmId = Integer.parseInt(filmIdParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID film non valido");
            return;
        }

      
        Film film = filmRepository.findById(filmId);
        if (film == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Film non trovato");
            return;
        }

      
        List<Giudizio> giudizi = giudizioRepository.findAll();
        giudizi.removeIf(g -> g.getFilm().getId() != filmId);

      
        HttpSession session = request.getSession(false);
        boolean isUtenteLoggato = (session != null && session.getAttribute("utente") != null);

       
        request.setAttribute("film", film);
        request.setAttribute("giudizi", giudizi);
        request.setAttribute("isUtenteLoggato", isUtenteLoggato);

        
        request.getRequestDispatcher("/dettaglioFilm.jsp").forward(request, response);
    }
}