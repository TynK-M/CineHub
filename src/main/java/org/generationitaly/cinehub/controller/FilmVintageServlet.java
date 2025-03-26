package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

import org.generationitaly.cinehub.entity.Film;
import org.generationitaly.cinehub.repository.FilmRepository;

@WebServlet("/FilmVintageServlet")
public class FilmVintageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Ottieni il repository (o DAO) che gestisce i film
        FilmRepository filmRepo = new FilmRepository();

        // Recupera la lista di film vintage (con vintage = true)
        List<Film> filmVintage = filmRepo.findAllVintage();

        // Metti la lista in request
        request.setAttribute("filmVintage", filmVintage);

        // Inoltra alla JSP che mostrerà questi film
        request.getRequestDispatcher("spettacoli/film_vintage.jsp").forward(request, response);
    }
}

