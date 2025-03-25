package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import org.generationitaly.cinehub.repository.UtenteRepository;
import org.generationitaly.cinehub.entity.Utente;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UtenteRepository repo = new UtenteRepository();
        Utente utente = repo.findByEmailAndPassword(email, password);

        if (utente != null) {
            HttpSession session = request.getSession();
            session.setAttribute("utente", utente);
            response.sendRedirect("home.jsp");
        } else {
            request.setAttribute("erroreLogin", "Email o password errati.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
