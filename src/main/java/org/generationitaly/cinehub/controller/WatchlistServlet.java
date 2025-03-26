package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

import org.generationitaly.cinehub.entity.Utente;
import org.generationitaly.cinehub.entity.Watchlist;
import org.generationitaly.cinehub.repository.WatchlistRepository;

@WebServlet("/WatchlistServlet")
public class WatchlistServlet extends HttpServlet {
    private final WatchlistRepository watchRepo = new WatchlistRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("utente") == null) {
            res.sendRedirect("autenticazione/login.jsp");
            return;
        }
        Utente utente = (Utente) session.getAttribute("utente");

        List<Watchlist> lista = watchRepo.findByUtente(utente.getId());
        req.setAttribute("watchlist", lista);
        req.getRequestDispatcher("spettacoli/watchlist.jsp").forward(req, res);
    }
}
