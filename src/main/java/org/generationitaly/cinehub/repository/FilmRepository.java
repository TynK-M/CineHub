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
