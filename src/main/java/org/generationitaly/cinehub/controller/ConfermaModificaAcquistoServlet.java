package org.generationitaly.cinehub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.generationitaly.cinehub.Util.JPAUtil;
import org.generationitaly.cinehub.entity.Acquisto;
import org.generationitaly.cinehub.entity.Posto;
import org.generationitaly.cinehub.entity.PostoAcquistato;
import org.generationitaly.cinehub.entity.PostoAcquistatoId;
import org.generationitaly.cinehub.entity.Utente;
import jakarta.persistence.EntityManager;

import java.io.IOException;
import java.util.List;

@WebServlet("/ConfermaModificaAcquistoServlet")
public class ConfermaModificaAcquistoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("utente") == null) {
            res.sendRedirect("login.jsp");
            return;
        }
        Utente utenteSession = (Utente) session.getAttribute("utente");

        int idAcquisto = Integer.parseInt(req.getParameter("idAcquisto"));
        String idPostoStr = req.getParameter("nuovoPosto"); // es. "37"

        EntityManager em = null;
        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();

            Acquisto acquisto = em.createQuery(
                            "SELECT a FROM Acquisto a " +
                                    "JOIN FETCH a.spettacolo s " +
                                    "JOIN FETCH a.utente u " +
                                    "WHERE a.id = :idAcquisto",
                            Acquisto.class
                    )
                    .setParameter("idAcquisto", idAcquisto)
                    .getSingleResult();

            if (!acquisto.getUtente().getId().equals(utenteSession.getId())) {
                // Non sei proprietario di questo acquisto => errore
                em.getTransaction().rollback();
                res.sendRedirect("errore.jsp");
                return;
            }

            em.createQuery("DELETE FROM PostoAcquistato pa WHERE pa.acquisto.id = :idAcq")
                    .setParameter("idAcq", idAcquisto)
                    .executeUpdate();

            if (idPostoStr != null && !idPostoStr.isEmpty()) {
                int idNuovoPosto = Integer.parseInt(idPostoStr);

                PostoAcquistato pa = new PostoAcquistato();
                pa.setAcquisto(acquisto);

                pa.setPosto(em.getReference(Posto.class, idNuovoPosto));

                em.persist(pa);
            }

            em.getTransaction().commit();

        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw new ServletException("Errore nella modifica acquisto", e);
        } finally {
            if (em != null) em.close();
        }


        res.sendRedirect("MieiAcquistiServlet");
    }
}
