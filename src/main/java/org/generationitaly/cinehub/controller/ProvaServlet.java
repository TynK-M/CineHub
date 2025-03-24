package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.generationitaly.cinehub.entity.Utente;
import org.generationitaly.cinehub.repository.UtenteRepository;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/utenti")
public class ProvaServlet extends HttpServlet {

    private final UtenteRepository utenteRepository = new UtenteRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        List<Utente> utenti = utenteRepository.findAll();

        out.println("<html><body>");
        out.println("<h1>Lista Utenti</h1>");

        if (utenti.isEmpty()) {
            out.println("<p>Nessun utente registrato.</p>");
        } else {
            out.println("<ul>");
            for (Utente u : utenti) {
                out.println("<li>" + u.getNome() + " " + u.getCognome() + " (" + u.getEmail() + ")</li>");
            }
            out.println("</ul>");
        }

        out.println("</body></html>");
    }
}
