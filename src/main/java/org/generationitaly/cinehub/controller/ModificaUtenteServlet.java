package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import org.generationitaly.cinehub.entity.Utente;
import org.generationitaly.cinehub.repository.UtenteRepository;

import java.io.IOException;

@WebServlet("/ModificaUtenteServlet")
public class ModificaUtenteServlet extends HttpServlet {

    private final UtenteRepository utenteRepo = new UtenteRepository();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fotoProfilo = request.getParameter("fotoProfilo");

        Utente utente = utenteRepo.findById(id);
        if (utente == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        utente.setEmail(email);
        if (password != null && !password.trim().isEmpty()) {
            utente.setPassword(password);
        }
        utente.setFotoProfilo(fotoProfilo);

        utenteRepo.update(utente);

        // aggiorna sessione se sei tu
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("utente") != null) {
            Utente sessionUser = (Utente) session.getAttribute("utente");
            if (sessionUser.getId().equals(utente.getId())) {
                session.setAttribute("utente", utente);
            }
        }

        response.sendRedirect("ProfiloServlet");
    }
}
