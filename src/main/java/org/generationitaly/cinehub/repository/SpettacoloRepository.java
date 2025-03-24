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
            spettacolo = em.find(Spettacolo.class, id);
        } catch (Exception e) {
            System.err.println("Errore nel recuperare lo spettacolo con ID " + id + ": " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return spettacolo;
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
