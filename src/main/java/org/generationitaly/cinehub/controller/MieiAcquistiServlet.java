package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.generationitaly.cinehub.entity.Acquisto;
import org.generationitaly.cinehub.entity.Utente;
import org.generationitaly.cinehub.repository.AcquistoRepository;

import java.io.IOException;
import java.util.List;

@WebServlet("/MieiAcquistiServlet")
public class MieiAcquistiServlet extends HttpServlet {

    private final AcquistoRepository acquistoRepo = new AcquistoRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("utente") == null) {
            res.sendRedirect("autenticazione/login.jsp");
            return;
        }

        Utente utente = (Utente) session.getAttribute("utente");
        // recupera tutti gli acquisti dell'utente dal DB
        List<Acquisto> acquisti = acquistoRepo.findByUtente(utente.getId());

        req.setAttribute("acquisti", acquisti);
        req.getRequestDispatcher("spettacoli/mieiAcquisti.jsp").forward(req, res);
    }
}
