package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import org.generationitaly.cinehub.entity.*;
import org.generationitaly.cinehub.repository.*;

@WebServlet("/GiudiziFilmServlet")
public class GiudiziFilmServlet extends HttpServlet {

    private final GiudizioRepository giudizioRepo = new GiudizioRepository();
    private final FilmRepository filmRepo = new FilmRepository();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int filmId = Integer.parseInt(request.getParameter("id"));
        Film film = filmRepo.findById(filmId);
        List<Giudizio> giudizi = giudizioRepo.findByFilm(film);

        request.setAttribute("film", film);
        request.setAttribute("giudizi", giudizi);

        request.getRequestDispatcher("dettaglioFilm.jsp").forward(request, response);
    }
}
