package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.generationitaly.cinehub.Util.JPAUtil;
import org.generationitaly.cinehub.entity.Film;
import org.generationitaly.cinehub.entity.Genere;
import org.generationitaly.cinehub.entity.Nazione;
import org.generationitaly.cinehub.repository.GenereRepository;
import org.generationitaly.cinehub.repository.NazioneRepository;
import org.generationitaly.cinehub.repository.FilmRepository;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/AggiungiFilmServlet")
public class AggiungiFilmServlet extends HttpServlet {

    private final GenereRepository genereRepository = new GenereRepository();
    private final NazioneRepository nazioneRepository = new NazioneRepository();
    private final FilmRepository filmRepository = new FilmRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Genere> generi = genereRepository.findAll();
        List<Nazione> nazioni = nazioneRepository.findAll();

        req.setAttribute("generi", generi);
        req.setAttribute("nazioni", nazioni);

        req.getRequestDispatcher("/admin/aggiungiFilm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String titolo = req.getParameter("titolo");
        String descrizione = req.getParameter("descrizione");
        String linkTrailer = req.getParameter("linkTrailer");
        int durata = Integer.parseInt(req.getParameter("durata"));
        LocalDate dataUscita = LocalDate.parse(req.getParameter("dataUscita"));
        String locandina = req.getParameter("locandina");
        int genereId = Integer.parseInt(req.getParameter("genereId"));
        int nazioneId = Integer.parseInt(req.getParameter("nazioneId"));
        boolean vintage = req.getParameter("vintage") != null;
        boolean checkUscita = req.getParameter("checkUscita") != null;

        Genere genere = genereRepository.findById(genereId);
        Nazione nazione = nazioneRepository.findById(nazioneId);

        Film film = new Film();
        film.setTitolo(titolo);
        film.setDescrizione(descrizione);
        film.setLinkTrailer(linkTrailer);
        film.setDurata(durata);
        film.setDataUscita(dataUscita);
        film.setLocandina(locandina);
        film.setGenere(genere);
        film.setNazione(nazione);
        film.setVintage(vintage);
        film.setCheckUscita(checkUscita);

        filmRepository.save(film);

        resp.sendRedirect(req.getContextPath() + "/AggiungiFilmServlet");
    }
}
