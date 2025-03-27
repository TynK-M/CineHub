package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.generationitaly.cinehub.entity.Utente;

import java.io.IOException;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Utente utente = (Utente) req.getSession().getAttribute("utente");

        if (utente != null && Boolean.TRUE.equals(utente.getAdmin())) {
            req.getRequestDispatcher("/admin/admin.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/HomeServlet");
        }
    }
}
