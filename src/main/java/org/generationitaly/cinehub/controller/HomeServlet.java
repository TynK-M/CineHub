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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String genere = request.getParameter("genere");
        String nazione = request.getParameter("nazione");
        String titolo = request.getParameter("titolo");

        if (genere == null) genere = "";
        if (nazione == null) nazione = "";
        if (titolo == null) titolo = "";

        List<Film> filmList = filmRepo.findByFiltri(genere, nazione, titolo);
        List<Film> filmUscita = filmRepo.findInUscita();
        List<String> generi = filmRepo.findGeneriDistinct();
        List<String> nazioni = filmRepo.findNazioniDistinct();

        request.setAttribute("filmList", filmList);
        request.setAttribute("filmUscita", filmUscita);
        request.setAttribute("generi", generi);
        request.setAttribute("nazioni", nazioni);
        request.setAttribute("genereSelezionato", genere);
        request.setAttribute("nazioneSelezionata", nazione);
        request.setAttribute("titoloRicerca", titolo); // ✅ Passa anche questo
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}

