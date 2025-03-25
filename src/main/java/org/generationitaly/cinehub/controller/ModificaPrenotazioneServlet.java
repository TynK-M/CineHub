package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import org.generationitaly.cinehub.entity.*;
import org.generationitaly.cinehub.repository.*;

import java.io.IOException;

@WebServlet("/ModificaPrenotazioneServlet")
public class ModificaPrenotazioneServlet extends HttpServlet {

    private final AcquistoRepository acquistoRepo = new AcquistoRepository();
    private final SpettacoloRepository spettacoloRepo = new SpettacoloRepository();
    private final PostoAcquistatoRepository postoAcquistatoRepo = new PostoAcquistatoRepository();
    private final PostoRepository postoRepo = new PostoRepository();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int acquistoId = Integer.parseInt(request.getParameter("acquistoId"));
        int nuovoSpettacoloId = Integer.parseInt(request.getParameter("spettacoloId"));
        String[] nuoviPosti = request.getParameterValues("posti");

        Acquisto acquisto = acquistoRepo.findById(acquistoId);
        Spettacolo nuovoSpettacolo = spettacoloRepo.findById(nuovoSpettacoloId);
        acquisto.setSpettacolo(nuovoSpettacolo);
        acquistoRepo.update(acquisto);

        // Elimina vecchi posti
        postoAcquistatoRepo.deleteByAcquisto(acquisto);

        for (String postoIdStr : nuoviPosti) {
            int postoId = Integer.parseInt(postoIdStr);
            Posto posto = postoRepo.findById(postoId);

            PostoAcquistato pa = new PostoAcquistato();
            pa.setAcquisto(acquisto);
            pa.setPosto(posto);
            postoAcquistatoRepo.save(pa);
        }

        response.sendRedirect("modificaPrenotazione.jsp");
    }
}
