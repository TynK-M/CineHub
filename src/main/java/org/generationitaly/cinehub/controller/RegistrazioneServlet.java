package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import org.generationitaly.cinehub.entity.Utente;
import org.generationitaly.cinehub.repository.UtenteRepository;
import org.generationitaly.cinehub.Util.PasswordUtil;

@WebServlet("/RegistrazioneServlet")
public class RegistrazioneServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UtenteRepository repo = new UtenteRepository();
        Utente utenteEsistente = repo.findByEmail(email);

        if (utenteEsistente != null) {
            request.setAttribute("erroreRegistrazione", "Questa email è già registrata.");
            request.getRequestDispatcher("autenticazione/register.jsp").forward(request, response);
            return;
        }

        Utente utente = new Utente();
        utente.setNome(nome);
        utente.setCognome(cognome);
        utente.setEmail(email);
        utente.setPassword(PasswordUtil.hashPassword(password));

        // Controlla se è stato selezionato il consenso alla newsletter
        String newsletterParam = request.getParameter("newsletter");
        utente.setConsensoNewsletter(newsletterParam != null); // true se presente

        repo.save(utente);

        response.sendRedirect("autenticazione/login.jsp");
    }
}
