package org.generationitaly.cinehub.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.generationitaly.cinehub.entity.Sala;
import org.generationitaly.cinehub.Util.JPAUtil;

import java.util.ArrayList;
import java.util.List;

public class SalaRepository {

    public Sala findById(Integer id) {
        EntityManager em = null;
        Sala sala = null;

        try {
            em = JPAUtil.getEntityManager();
            sala = em.find(Sala.class, id);
        } catch (Exception e) {
            System.err.println("Errore nel recuperare la sala con ID " + id + ": " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return sala;
    }

    public List<Sala> findAll() {
        EntityManager em = null;
        List<Sala> lista = new ArrayList<>();

        try {
            em = JPAUtil.getEntityManager();
            TypedQuery<Sala> query = em.createQuery("SELECT s FROM Sala s", Sala.class);
            lista = query.getResultList();
        } catch (Exception e) {
            System.err.println("Errore nel recuperare le sale: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return lista;
    }

    public void save(Sala sala) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.persist(sala);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nel salvare la sala: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void update(Sala sala) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.merge(sala);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'aggiornare la sala: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void delete(Sala sala) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            Sala salaGestita = em.merge(sala);
            em.remove(salaGestita);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'eliminare la sala: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }
}
