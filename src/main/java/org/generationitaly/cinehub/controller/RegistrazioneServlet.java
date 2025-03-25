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


        //ricorda che solo un email puo registrarsi alla volta.


        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Utente utente = new Utente();
        utente.setNome(nome);
        utente.setCognome(cognome);
        utente.setEmail(email);
        utente.setPassword(PasswordUtil.hashPassword(password)); // <-- HASH

        UtenteRepository repo = new UtenteRepository();
        repo.save(utente);

        response.sendRedirect("login.jsp");
    }
}
