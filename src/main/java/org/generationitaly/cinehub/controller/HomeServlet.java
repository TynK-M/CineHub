package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

import org.generationitaly.cinehub.entity.Film;
import org.generationitaly.cinehub.repository.FilmRepository;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {

    private final FilmRepository filmRepo = new FilmRepository();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Film> filmList = filmRepo.findAll();
        request.setAttribute("filmList", filmList);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}

