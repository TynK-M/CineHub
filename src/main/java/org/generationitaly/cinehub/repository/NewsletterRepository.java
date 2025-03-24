package org.generationitaly.cinehub.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.generationitaly.cinehub.entity.Newsletter;
import org.generationitaly.cinehub.Util.JPAUtil;

import java.util.ArrayList;
import java.util.List;

public class NewsletterRepository {

    public Newsletter findById(Integer id) {
        EntityManager em = null;
        Newsletter newsletter = null;

        try {
            em = JPAUtil.getEntityManager();
            newsletter = em.find(Newsletter.class, id);
        } catch (Exception e) {
            System.err.println("Errore nel recuperare la newsletter con ID " + id + ": " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return newsletter;
    }

    public List<Newsletter> findAll() {
        EntityManager em = null;
        List<Newsletter> lista = new ArrayList<>();

        try {
            em = JPAUtil.getEntityManager();
            TypedQuery<Newsletter> query = em.createQuery("SELECT n FROM Newsletter n", Newsletter.class);
            lista = query.getResultList();
        } catch (Exception e) {
            System.err.println("Errore nel recuperare le newsletter: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return lista;
    }

    public void save(Newsletter newsletter) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.persist(newsletter);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nel salvare la newsletter: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void update(Newsletter newsletter) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.merge(newsletter);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'aggiornare la newsletter: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void delete(Newsletter newsletter) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.remove(em.merge(newsletter));
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'eliminare la newsletter: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }
}
