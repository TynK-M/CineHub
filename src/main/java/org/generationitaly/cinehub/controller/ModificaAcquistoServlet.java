package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.generationitaly.cinehub.entity.Acquisto;
import org.generationitaly.cinehub.entity.Posto;
import org.generationitaly.cinehub.repository.AcquistoRepository;
import org.generationitaly.cinehub.repository.PostoRepository;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/ModificaAcquistoServlet")
public class ModificaAcquistoServlet extends HttpServlet {
    private final AcquistoRepository acquistoRepo = new AcquistoRepository();
    private final PostoRepository postoRepo = new PostoRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        int idAcquisto = Integer.parseInt(req.getParameter("id"));
        Acquisto ac = acquistoRepo.findByIdWithFetch(idAcquisto);

        int salaId = ac.getSpettacolo().getSala().getId();
        List<Posto> tuttiPosti = postoRepo.findAllBySala(salaId);

        List<Posto> postiDisponibili = postoRepo.findDisponibiliPerSpettacolo(ac.getSpettacolo().getId());

        Map<Integer, Boolean> liberoMap = new HashMap<>();
        for (Posto p : tuttiPosti) {
            boolean isLibero = false;
            for (Posto d : postiDisponibili) {
                if (d.getId().equals(p.getId())) {
                    isLibero = true;
                    break;
                }
            }
            liberoMap.put(p.getId(), isLibero);
        }

        // 5) Passa i dati alla JSP
        req.setAttribute("acquisto", ac);
        req.setAttribute("tuttiPosti", tuttiPosti);
        req.setAttribute("liberoMap", liberoMap);

        req.getRequestDispatcher("spettacoli/modificaAcquisto.jsp").forward(req, res);
    }
}
