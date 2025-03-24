package org.generationitaly.cinehub.repository;

import jakarta.persistence.EntityManager;
import org.generationitaly.cinehub.entity.PostoAcquistato;
import org.generationitaly.cinehub.entity.PostoAcquistatoId;
import org.generationitaly.cinehub.Util.JPAUtil;

import java.util.ArrayList;
import java.util.List;

public class PostoAcquistatoRepository {

    public PostoAcquistato findById(PostoAcquistatoId id) {
        EntityManager em = null;
        PostoAcquistato pa = null;

        try {
            em = JPAUtil.getEntityManager();
            pa = em.find(PostoAcquistato.class, id);
        } catch (Exception e) {
            System.err.println("Errore nel trovare il posto acquistato: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return pa;
    }

    public List<PostoAcquistato> findAll() {
        EntityManager em = null;
        List<PostoAcquistato> lista = new ArrayList<>();

        try {
            em = JPAUtil.getEntityManager();
            lista = em.createQuery("SELECT p FROM PostoAcquistato p", PostoAcquistato.class).getResultList();
        } catch (Exception e) {
            System.err.println("Errore nel recuperare i posti acquistati: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return lista;
    }

    public void save(PostoAcquistato pa) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.persist(pa);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nel salvare il posto acquistato: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void delete(PostoAcquistato pa) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.remove(em.merge(pa));
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'eliminare il posto acquistato: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }
}
