package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import org.generationitaly.cinehub.entity.*;
import org.generationitaly.cinehub.repository.*;

@WebServlet("/PrenotazioneServlet")
public class PrenotazioneServlet extends HttpServlet {

    private final SpettacoloRepository spettacoloRepo = new SpettacoloRepository();
    private final PostoRepository postoRepo = new PostoRepository();
    private final PostoAcquistatoRepository postoAcquistatoRepo = new PostoAcquistatoRepository();
    private final AcquistoRepository acquistoRepo = new AcquistoRepository();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Utente utente = (Utente) session.getAttribute("utente");

        if (utente == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int spettacoloId = Integer.parseInt(request.getParameter("spettacoloId"));
        String[] postiIds = request.getParameterValues("posti"); // esempio: ["12", "13"]

        Spettacolo spettacolo = spettacoloRepo.findById(spettacoloId);
        Acquisto acquisto = new Acquisto();
        acquisto.setUtente(utente);
        acquisto.setSpettacolo(spettacolo);
        acquistoRepo.save(acquisto);

        for (String postoIdStr : postiIds) {
            int postoId = Integer.parseInt(postoIdStr);
            Posto posto = postoRepo.findById(postoId);

            PostoAcquistato pa = new PostoAcquistato();
            pa.setAcquisto(acquisto);
            pa.setPosto(posto);
            postoAcquistatoRepo.save(pa);
        }

        response.sendRedirect("home.jsp");
    }
}
