package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import org.generationitaly.cinehub.entity.Giudizio;
import org.generationitaly.cinehub.entity.Utente;
import org.generationitaly.cinehub.entity.Watchlist; // entità watchlist
import org.generationitaly.cinehub.repository.GiudizioRepository;
import org.generationitaly.cinehub.repository.UtenteRepository;
import org.generationitaly.cinehub.repository.WatchlistRepository;

@WebServlet("/ProfiloServlet")
public class ProfiloServlet extends HttpServlet {

    private final UtenteRepository utenteRepository = new UtenteRepository();
    private final GiudizioRepository giudizioRepository = new GiudizioRepository();
    private final WatchlistRepository watchlistRepository = new WatchlistRepository(); // aggiunto

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Utente sessionUser = (session != null) ? (Utente) session.getAttribute("utente") : null;

        String idParam = request.getParameter("id");
        Utente utenteProfilo = null;

        // Se nessun ID -> mostra profilo del loggato
        if (idParam == null) {
            if (sessionUser == null) {
                response.sendRedirect("autenticazione/login.jsp");
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

        // Carica i giudizi utente
        List<Giudizio> giudiziUtente = giudizioRepository.findByUtente(utenteProfilo);

        // Carica watchlist utente
        List<Watchlist> watchlistUtente = watchlistRepository.findByUtente(utenteProfilo.getId());

        request.setAttribute("utenteProfilo", utenteProfilo);
        request.setAttribute("giudiziUtente", giudiziUtente);
        request.setAttribute("watchlistUtente", watchlistUtente);

        request.getRequestDispatcher("profilo.jsp").forward(request, response);
    }
}
