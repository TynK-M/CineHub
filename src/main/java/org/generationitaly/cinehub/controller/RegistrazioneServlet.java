package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import org.generationitaly.cinehub.entity.Utente;
import org.generationitaly.cinehub.repository.UtenteRepository;

@WebServlet("/RegistrazioneServlet")
public class RegistrazioneServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Utente utente = new Utente();
        utente.setNome(nome);
        utente.setEmail(email);
        utente.setPassword(password);

        UtenteRepository repo = new UtenteRepository();
        repo.save(utente);

        response.sendRedirect("login.jsp");
    }
}
