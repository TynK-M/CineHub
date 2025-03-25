package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import org.generationitaly.cinehub.entity.Utente;
import org.generationitaly.cinehub.repository.UtenteRepository;
import org.generationitaly.cinehub.Util.PasswordUtil;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UtenteRepository repo = new UtenteRepository();
        Utente utente = repo.findByEmail(email);

        if (utente != null && PasswordUtil.checkPassword(password, utente.getPassword())) {
            HttpSession session = request.getSession();
            session.setAttribute("utente", utente);
            response.sendRedirect("HomeServlet");
        } else {
            System.out.println("LOGIN: email=" + email + ", utente=" + utente);
            request.setAttribute("erroreLogin", "Email o password errati.");
            request.getRequestDispatcher("autenticazione/login.jsp").forward(request, response); // <- cambia qui
        }

    }
}
