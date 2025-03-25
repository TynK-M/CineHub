package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.generationitaly.cinehub.entity.Posto;
import org.generationitaly.cinehub.entity.Spettacolo;
import org.generationitaly.cinehub.repository.PostoRepository;
import org.generationitaly.cinehub.repository.SpettacoloRepository;

import java.io.IOException;
import java.util.*;

@WebServlet("/PrenotaSpettacoloServlet")
public class PrenotaSpettacoloServlet extends HttpServlet {

    private final SpettacoloRepository spettacoloRepo = new SpettacoloRepository();
    private final PostoRepository postoRepo = new PostoRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("utente") == null) {
            res.sendRedirect("autenticazione/login.jsp");
            return;
        }

        int idSpettacolo = Integer.parseInt(req.getParameter("id"));
        Spettacolo spettacolo = spettacoloRepo.findByIdWithFetch(idSpettacolo);

        List<Posto> tuttiPosti = postoRepo.findAllBySala(spettacolo.getSala().getId());

        List<Posto> postiDisponibili = postoRepo.findDisponibiliPerSpettacolo(idSpettacolo);

        Map<Integer, Boolean> liberoMap = new HashMap<>();
        for (Posto p : tuttiPosti) {
            boolean isLibero = false;
            for (Posto disp : postiDisponibili) {
                if (disp.getId().equals(p.getId())) {
                    isLibero = true;
                    break;
                }
            }
            liberoMap.put(p.getId(), isLibero);
        }

        req.setAttribute("spettacolo", spettacolo);
        req.setAttribute("tuttiPosti", tuttiPosti);
        req.setAttribute("liberoMap", liberoMap);

        req.getRequestDispatcher("spettacoli/prenotaSpettacolo.jsp").forward(req, res);
    }
}
