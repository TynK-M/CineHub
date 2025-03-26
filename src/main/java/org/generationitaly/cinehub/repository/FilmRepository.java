package org.generationitaly.cinehub.repository;

import jakarta.persistence.*;
import org.generationitaly.cinehub.entity.Film;
import org.generationitaly.cinehub.Util.JPAUtil;

import java.util.ArrayList;
import java.util.List;

public class FilmRepository {

    public Film findById(Integer id) {
        EntityManager em = null;
        Film film = null;

        try {
            em = JPAUtil.getEntityManager();
            film = em.find(Film.class, id);
        } catch (Exception e) {
            System.err.println("Errore nel recuperare il film: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return film;
    }

    public List<String> findGeneriDistinct() {
        EntityManager em = JPAUtil.getEntityManager();
        return em.createQuery("SELECT DISTINCT f.genere FROM Film f WHERE f.genere IS NOT NULL", String.class)
                .getResultList();
    }

    public List<String> findNazioniDistinct() {
        EntityManager em = JPAUtil.getEntityManager();
        return em.createQuery("SELECT DISTINCT f.nazione FROM Film f", String.class)
                .getResultList();
    }

    public List<Film> findByFiltri(String genere, String nazione, String titolo) {
        EntityManager em = null;
        List<Film> list = new ArrayList<>();

        try {
            em = JPAUtil.getEntityManager();
            TypedQuery<Film> query = em.createQuery(
                    "SELECT f FROM Film f WHERE " +
                            "(:genere IS NULL OR f.genere = :genere) AND " +
                            "(:nazione IS NULL OR f.nazione = :nazione) AND " +
                            "(:titolo IS NULL OR LOWER(f.titolo) LIKE LOWER(CONCAT('%', :titolo, '%')))",
                    Film.class);
            query.setParameter("genere", genere.isEmpty() ? null : genere);
            query.setParameter("nazione", nazione.isEmpty() ? null : nazione);
            query.setParameter("titolo", titolo.isEmpty() ? null : titolo);

            list = query.getResultList();
        } finally {
            if (em != null) em.close();
        }

        return list;
    }

    public List<Film> findInUscita() {
        EntityManager em = JPAUtil.getEntityManager();
        return em.createQuery("SELECT f FROM Film f WHERE f.checkUscita = true", Film.class).getResultList();
    }

    public List<Film> findAllVintage() {
        EntityManager em = null;
        List<Film> list = new ArrayList<>();
        try {
            em = JPAUtil.getEntityManager();
            // Supponendo che l'attributo nell'Entity Film si chiami `vintage` (boolean)
            TypedQuery<Film> query = em.createQuery(
                    "SELECT f FROM Film f WHERE f.vintage = true", Film.class
            );
            list = query.getResultList();
        } catch (Exception e) {
            System.err.println("Errore nel recuperare i film vintage: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
        return list;
    }


    public List<Film> findAll() {
        EntityManager em = null;
        List<Film> list = new ArrayList<>();

        try {
            em = JPAUtil.getEntityManager();
            list = em.createQuery("SELECT f FROM Film f", Film.class).getResultList();
        } catch (Exception e) {
            System.err.println("Errore nel recuperare i film: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return list;
    }

    public void save(Film film) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.persist(film);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nel salvare il film: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void update(Film film) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.merge(film);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'aggiornare il film: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void delete(Film film) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.remove(em.merge(film));
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'eliminare il film: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }
}
