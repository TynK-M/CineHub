package org.generationitaly.cinehub.controller;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.generationitaly.cinehub.Util.JPAUtil;
import org.generationitaly.cinehub.entity.Film;

import java.io.IOException;
import java.util.List;

@WebServlet("/ModificaFilmServlet")
public class ModificaFilmServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EntityManager em = JPAUtil.getEntityManager();
        List<Film> films = em.createQuery("SELECT f FROM Film f", Film.class).getResultList();
        em.close();

        request.setAttribute("films", films);
        request.getRequestDispatcher("/admin/modificaFilm.jsp").forward(request, response);
    }
}
