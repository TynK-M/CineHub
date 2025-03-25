package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.generationitaly.cinehub.entity.Spettacolo;
import org.generationitaly.cinehub.repository.SpettacoloRepository;

import java.io.IOException;
import java.util.List;

@WebServlet("/ListaSpettacoliServlet")
public class ListaSpettacoliServlet extends HttpServlet {
    private final SpettacoloRepository spettacoloRepo = new SpettacoloRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("utente") == null) {
            res.sendRedirect("autenticazione/login.jsp");
            return;
        }
        String titolo = req.getParameter("titolo");
        String data = req.getParameter("data");

        List<Spettacolo> spettacoli = spettacoloRepo.findByTitoloOrData(titolo, data);
        req.setAttribute("spettacoli", spettacoli);
        req.getRequestDispatcher("spettacoli/listaSpettacoli.jsp").forward(req, res);
    }
}

