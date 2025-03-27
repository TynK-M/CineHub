package org.generationitaly.cinehub.controller;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.generationitaly.cinehub.Util.JPAUtil;
import org.generationitaly.cinehub.entity.Film;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/AggiungiFilmServlet")
public class AggiungiFilmServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
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
        String genere = req.getParameter("genere");
        String nazione = req.getParameter("nazione");
        boolean vintage = req.getParameter("vintage") != null;
        boolean checkUscita = req.getParameter("checkUscita") != null;

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

        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(film);
        tx.commit();
        em.close();

        resp.sendRedirect(req.getContextPath() + "/AggiungiFilmServlet");
    }
}
