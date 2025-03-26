package org.generationitaly.cinehub.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import org.generationitaly.cinehub.Util.JPAUtil;
import org.generationitaly.cinehub.entity.Watchlist;

import java.util.ArrayList;
import java.util.List;

public class WatchlistRepository {

    public Watchlist findById(Integer id) {
        EntityManager em = null;
        Watchlist w = null;
        try {
            em = JPAUtil.getEntityManager();
            w = em.find(Watchlist.class, id);
        } finally {
            if (em != null) em.close();
        }
        return w;
    }

    public void save(Watchlist watch) {
        EntityManager em = null;
        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.persist(watch);
            em.getTransaction().commit();
        } catch(Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nel salvare watchlist: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void delete(Watchlist watch) {
        EntityManager em = null;
        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.remove(em.merge(watch));
            em.getTransaction().commit();
        } catch(Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nel cancellare watchlist: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public List<Watchlist> findByUtente(int idUtente) {
        EntityManager em = null;
        List<Watchlist> result = new ArrayList<>();
        try {
            em = JPAUtil.getEntityManager();
            TypedQuery<Watchlist> query = em.createQuery(
                    "SELECT w FROM Watchlist w " +
                            "JOIN FETCH w.film " +
                            "WHERE w.utente.id = :idUtente",
                    Watchlist.class);
            query.setParameter("idUtente", idUtente);
            result = query.getResultList();
        } finally {
            if (em != null) em.close();
        }
        return result;
    }

    public Watchlist findByUtenteAndFilm(int idUtente, int idFilm) {
        EntityManager em = null;
        Watchlist watch = null;
        try {
            em = JPAUtil.getEntityManager();
            TypedQuery<Watchlist> query = em.createQuery(
                    "SELECT w FROM Watchlist w " +
                            "WHERE w.utente.id = :idUtente AND w.film.id = :idFilm",
                    Watchlist.class);
            query.setParameter("idUtente", idUtente);
            query.setParameter("idFilm", idFilm);
            watch = query.getSingleResult();
        } catch(NoResultException e) {
            watch = null; // se non trovato
        } finally {
            if (em != null) em.close();
        }
        return watch;
    }
}
