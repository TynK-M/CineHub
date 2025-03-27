package org.generationitaly.cinehub.controller;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.generationitaly.cinehub.Util.JPAUtil;
import org.generationitaly.cinehub.entity.Film;

import java.io.IOException;

@WebServlet("/EliminaFilmServlet")
public class EliminaFilmServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            Film film = em.find(Film.class, id);
            if (film != null) {
                em.remove(film);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw new ServletException("Errore durante l'eliminazione del film", e);
        } finally {
            em.close();
        }

        resp.sendRedirect(req.getContextPath() + "/ModificaFilmServlet");
    }
}
