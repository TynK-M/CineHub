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

@WebServlet("/ModificaSingoloFilmServlet")
public class ModificaSingoloFilmServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        EntityManager em = JPAUtil.getEntityManager();
        Film film = em.find(Film.class, id);
        em.close();

        req.setAttribute("film", film);
        req.getRequestDispatcher("/admin/modificaSingoloFilm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();

        Film film = em.find(Film.class, id);

        film.setTitolo(req.getParameter("titolo"));
        film.setDescrizione(req.getParameter("descrizione"));
        film.setLinkTrailer(req.getParameter("linkTrailer"));
        film.setDurata(Integer.parseInt(req.getParameter("durata")));
        film.setDataUscita(LocalDate.parse(req.getParameter("dataUscita")));
        film.setLocandina(req.getParameter("locandina"));
        film.setGenere(req.getParameter("genere"));
        film.setNazione(req.getParameter("nazione"));
        film.setVintage(req.getParameter("vintage") != null);
        film.setCheckUscita(req.getParameter("checkUscita") != null);

        tx.commit();
        em.close();

        resp.sendRedirect(req.getContextPath() + "/ModificaFilmServlet");
    }
}
