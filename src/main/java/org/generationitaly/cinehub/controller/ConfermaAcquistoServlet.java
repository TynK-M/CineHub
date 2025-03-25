package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.generationitaly.cinehub.entity.Utente;
import org.generationitaly.cinehub.repository.AcquistoRepository;

import java.io.IOException;

@WebServlet("/ConfermaAcquistoServlet")
public class ConfermaAcquistoServlet extends HttpServlet {
    private final AcquistoRepository acquistoRepo = new AcquistoRepository();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("utente") == null) {
            // Nessuno loggato => Redirect
            res.sendRedirect("login.jsp");
            return;
        }

        Utente utente = (Utente) session.getAttribute("utente");

        int idSpettacolo = Integer.parseInt(req.getParameter("idSpettacolo"));
        String[] posti = req.getParameterValues("posti");

        // adesso utente.getId() non darà più NullPointerException
        acquistoRepo.creaAcquisto(utente.getId(), idSpettacolo, posti);

        req.getRequestDispatcher("spettacoli/riepilogoAcquisto.jsp").forward(req, res);
    }

}
