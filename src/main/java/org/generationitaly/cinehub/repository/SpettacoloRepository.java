package org.generationitaly.cinehub.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.generationitaly.cinehub.entity.Spettacolo;
import org.generationitaly.cinehub.Util.JPAUtil;

import java.util.ArrayList;
import java.util.List;

public class SpettacoloRepository {

    public Spettacolo findById(Integer id) {
        EntityManager em = null;
        Spettacolo spettacolo = null;

        try {
            em = JPAUtil.getEntityManager();
            spettacolo = em.createQuery(
                            "SELECT s FROM Spettacolo s " +
                                    "JOIN FETCH s.film " +
                                    "JOIN FETCH s.sala " +
                                    "WHERE s.id = :id", Spettacolo.class)
                    .setParameter("id", id)
                    .getSingleResult();
        } catch (Exception e) {
            System.err.println("Errore nel recuperare lo spettacolo con ID " + id + ": " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return spettacolo;
    }

    public Spettacolo findByIdWithFetch(int id) {
        EntityManager em = null;
        Spettacolo s = null;
        try {
            em = JPAUtil.getEntityManager();
            TypedQuery<Spettacolo> query = em.createQuery(
                    "SELECT sp FROM Spettacolo sp " +
                            "JOIN FETCH sp.film " +
                            "JOIN FETCH sp.sala " +
                            "WHERE sp.id = :id", Spettacolo.class
            );
            query.setParameter("id", id);
            s = query.getSingleResult();
        } finally {
            if (em != null) em.close();
        }
        return s;
    }

    public boolean existsByFilm(int filmId) {
        EntityManager em = null;
        try {
            em = JPAUtil.getEntityManager();
            Long count = em.createQuery(
                            "SELECT COUNT(s) FROM Spettacolo s WHERE s.film.id = :filmId",
                            Long.class
                    )
                    .setParameter("filmId", filmId)
                    .getSingleResult();

            return count > 0;
        } finally {
            if (em != null) em.close();
        }
    }

    public List<Spettacolo> findByTitoloOrData(String titolo, String data) {
        EntityManager em = null;
        List<Spettacolo> result = new ArrayList<>();

        try {
            em = JPAUtil.getEntityManager();

            String jpql = "SELECT s FROM Spettacolo s " +
                    "JOIN FETCH s.film " +
                    "JOIN FETCH s.sala " +
                    "WHERE (:titolo IS NULL OR LOWER(s.film.titolo) LIKE LOWER(CONCAT('%', :titolo, '%'))) " +
                    "AND (:data IS NULL OR s.data = :data)";

            TypedQuery<Spettacolo> query = em.createQuery(jpql, Spettacolo.class);

            query.setParameter("titolo", titolo != null && !titolo.isBlank() ? titolo : null);
            query.setParameter("data", data != null && !data.isBlank() ? java.sql.Date.valueOf(data) : null);

            result = query.getResultList();

        } catch (Exception e) {
            System.err.println("Errore nella ricerca degli spettacoli: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return result;
    }

    public List<Spettacolo> findAll() {
        EntityManager em = null;
        List<Spettacolo> lista = new ArrayList<>();

        try {
            em = JPAUtil.getEntityManager();
            TypedQuery<Spettacolo> query = em.createQuery("SELECT s FROM Spettacolo s", Spettacolo.class);
            lista = query.getResultList();
        } catch (Exception e) {
            System.err.println("Errore nel recuperare gli spettacoli: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return lista;
    }

    public void save(Spettacolo spettacolo) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.persist(spettacolo);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nel salvare lo spettacolo: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void update(Spettacolo spettacolo) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.merge(spettacolo);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'aggiornare lo spettacolo: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void delete(Spettacolo spettacolo) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            Spettacolo spettacoloGestito = em.merge(spettacolo);
            em.remove(spettacoloGestito);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'eliminare lo spettacolo: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }
}
