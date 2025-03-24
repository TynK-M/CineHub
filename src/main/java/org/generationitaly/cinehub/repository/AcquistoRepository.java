package org.generationitaly.cinehub.repository;

import jakarta.persistence.*;
import org.generationitaly.cinehub.entity.Acquisto;
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
