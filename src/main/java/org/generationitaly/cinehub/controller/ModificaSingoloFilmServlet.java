package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.generationitaly.cinehub.entity.Film;
import org.generationitaly.cinehub.entity.Genere;
import org.generationitaly.cinehub.repository.FilmRepository;
import org.generationitaly.cinehub.repository.GenereRepository;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/ModificaSingoloFilmServlet")
public class ModificaSingoloFilmServlet extends HttpServlet {

    private final GenereRepository genereRepository = new GenereRepository();
    private final FilmRepository filmRepository = new FilmRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        Film film = filmRepository.findById(id);
        List<Genere> generi = genereRepository.findAll();

        req.setAttribute("film", film);
        req.setAttribute("generi", generi);
        req.getRequestDispatcher("/admin/modificaSingoloFilm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        Film film = filmRepository.findById(id);

        film.setTitolo(req.getParameter("titolo"));
        film.setDescrizione(req.getParameter("descrizione"));
        film.setLinkTrailer(req.getParameter("linkTrailer"));
        film.setDurata(Integer.parseInt(req.getParameter("durata")));
        film.setDataUscita(LocalDate.parse(req.getParameter("dataUscita")));
        film.setLocandina(req.getParameter("locandina"));

        int genereId = Integer.parseInt(req.getParameter("genereId"));
        film.setGenere(genereRepository.findById(genereId));

        film.setNazione(req.getParameter("nazione"));
        film.setVintage(req.getParameter("vintage") != null);
        film.setCheckUscita(req.getParameter("checkUscita") != null);

        filmRepository.update(film);

        resp.sendRedirect(req.getContextPath() + "/ModificaFilmServlet");
    }
}
