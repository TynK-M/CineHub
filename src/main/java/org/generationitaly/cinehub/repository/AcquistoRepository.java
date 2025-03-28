package org.generationitaly.cinehub.repository;

import jakarta.persistence.*;
import org.generationitaly.cinehub.entity.*;
import org.generationitaly.cinehub.Util.JPAUtil;

import java.util.ArrayList;
import java.util.List;

public class AcquistoRepository {

    public Acquisto findById(Integer id) {
        EntityManager em = null;
        Acquisto acquisto = null;

        try {
            em = JPAUtil.getEntityManager();
            acquisto = em.find(Acquisto.class, id);
        } catch (Exception e) {
            System.err.println("Errore nel recuperare l'acquisto: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return acquisto;
    }

    public List<Acquisto> findByUtente(int utenteId) {
        EntityManager em = JPAUtil.getEntityManager();
        List<Acquisto> acquisti = em.createQuery(
                "SELECT DISTINCT a FROM Acquisto a " +
                        "JOIN FETCH a.spettacolo s " +
                        "JOIN FETCH s.film " +
                        "JOIN FETCH s.sala sala " + // forza caricamento sala
                        "LEFT JOIN FETCH a.postiAcquistati pa " +
                        "LEFT JOIN FETCH pa.posto p " +
                        "LEFT JOIN FETCH p.sala " + // forza caricamento sala del posto (non necessaria ma ok)
                        "WHERE a.utente.id = :id", Acquisto.class
        ).setParameter("id", utenteId).getResultList();
        em.close();
        return acquisti;
    }

    public Acquisto findByIdWithFetch(int id) {
        EntityManager em = null;
        Acquisto acquisto = null;
        try {
            em = JPAUtil.getEntityManager();

            // Carica Acquisto + Spettacolo + Film
            TypedQuery<Acquisto> query = em.createQuery(
                    "SELECT a FROM Acquisto a " +
                            "JOIN FETCH a.spettacolo s " +       // carica lo spettacolo
                            "JOIN FETCH s.film f " +            // carica anche film
                            "WHERE a.id = :id",
                    Acquisto.class
            );
            query.setParameter("id", id);

            acquisto = query.getSingleResult();
        } catch (Exception e) {
            System.err.println("findByIdWithFetch error: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
        return acquisto;
    }

    public List<Acquisto> findAll() {
        EntityManager em = null;
        List<Acquisto> list = new ArrayList<>();

        try {
            em = JPAUtil.getEntityManager();
            list = em.createQuery("SELECT a FROM Acquisto a", Acquisto.class).getResultList();
        } catch (Exception e) {
            System.err.println("Errore nel recuperare gli acquisti: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return list;
    }

    public void save(Acquisto acquisto) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.persist(acquisto);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nel salvare l'acquisto: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void creaAcquisto(int idUtente, int idSpettacolo, String[] idPosti) {
        EntityManager em = null;
        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();

            // Crea l'acquisto
            Acquisto acquisto = new Acquisto();
            acquisto.setUtente(em.getReference(Utente.class, idUtente));
            acquisto.setSpettacolo(em.getReference(Spettacolo.class, idSpettacolo));
            em.persist(acquisto);

            // Aggiungi i posti acquistati
            for (String idPostoStr : idPosti) {
                int idPosto = Integer.parseInt(idPostoStr);
                PostoAcquistato pa = new PostoAcquistato();
                pa.setAcquisto(acquisto);
                pa.setPosto(em.getReference(Posto.class, idPosto));
                em.persist(pa);
            }

            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nella creazione dell'acquisto: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void update(Acquisto acquisto) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.merge(acquisto);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'aggiornare l'acquisto: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void delete(Acquisto acquisto) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.remove(em.merge(acquisto));
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'eliminare l'acquisto: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }
}
