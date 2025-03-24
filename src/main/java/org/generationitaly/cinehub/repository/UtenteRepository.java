package org.generationitaly.cinehub.repository;

import jakarta.persistence.*;
import org.generationitaly.cinehub.entity.Utente;
import org.generationitaly.cinehub.Util.JPAUtil;

import java.util.ArrayList;
import java.util.List;

public class UtenteRepository {

    public Utente findById(Integer id) {
        EntityManager em = null;
        Utente utente = null;

        try {
            em = JPAUtil.getEntityManager();
            utente = em.find(Utente.class, id);
        } catch (Exception e) {
            System.err.println("Errore nel recuperare l'utente: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return utente;
    }

    public List<Utente> findAll() {
        EntityManager em = null;
        List<Utente> list = new ArrayList<>();

        try {
            em = JPAUtil.getEntityManager();
            list = em.createQuery("SELECT u FROM Utente u", Utente.class).getResultList();
        } catch (Exception e) {
            System.err.println("Errore nel recuperare gli utenti: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return list;
    }

    public void save(Utente utente) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.persist(utente);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nel salvare l'utente: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void update(Utente utente) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.merge(utente);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'aggiornare l'utente: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void delete(Utente utente) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.remove(em.merge(utente));
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'eliminare l'utente: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    // Metodo aggiuntivo per trovare un utente per email
    public Utente findByEmail(String email) {
        EntityManager em = null;
        Utente utente = null;

        try {
            em = JPAUtil.getEntityManager();
            Query query = em.createQuery("SELECT u FROM Utente u WHERE u.email = :email", Utente.class);
            query.setParameter("email", email);
            utente = (Utente) query.getSingleResult();
        } catch (Exception e) {
            System.err.println("Errore nel trovare l'utente per email: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return utente;
    }
}
 