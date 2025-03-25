package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import org.generationitaly.cinehub.entity.Giudizio;
import org.generationitaly.cinehub.entity.Utente;
import org.generationitaly.cinehub.repository.GiudizioRepository;
import org.generationitaly.cinehub.repository.UtenteRepository;

@WebServlet("/ProfiloServlet")
public class ProfiloServlet extends HttpServlet {

    private final UtenteRepository utenteRepository = new UtenteRepository();
    private final GiudizioRepository giudizioRepository = new GiudizioRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Utente sessionUser = (session != null) ? (Utente) session.getAttribute("utente") : null;

        String idParam = request.getParameter("id");
        Utente utenteProfilo = null;

        // Se non c'è id -> mostra il profilo dell'utente loggato
        if (idParam == null) {
            if (sessionUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            utenteProfilo = sessionUser;
        } else {
            try {
                int id = Integer.parseInt(idParam);
                utenteProfilo = utenteRepository.findById(id);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID utente non valido");
                return;
            }
        }

        if (utenteProfilo == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Utente non trovato");
            return;
        }

        // Recupera i giudizi/commenti dell’utente
        List<Giudizio> giudiziUtente = giudizioRepository.findByUtente(utenteProfilo);

        request.setAttribute("utenteProfilo", utenteProfilo);
        request.setAttribute("giudiziUtente", giudiziUtente);
        request.getRequestDispatcher("profilo.jsp").forward(request, response);
    }
}
