package org.generationitaly.cinehub.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.generationitaly.cinehub.entity.Posto;
import org.generationitaly.cinehub.Util.JPAUtil;

import java.util.ArrayList;
import java.util.List;

public class PostoRepository {

    public Posto findById(Integer id) {
        EntityManager em = null;
        Posto posto = null;

        try {
            em = JPAUtil.getEntityManager();
            posto = em.find(Posto.class, id);
        } catch (Exception e) {
            System.err.println("Errore nel recuperare il posto: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return posto;
    }

    public List<Posto> findAllBySala(int idSala) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery(
                    "SELECT p FROM Posto p WHERE p.sala.id = :idSala ORDER BY p.numero",
                    Posto.class
            ).setParameter("idSala", idSala).getResultList();
        } finally {
            em.close();
        }
    }

    public List<Posto> findDisponibiliPerSpettacolo(int idSpettacolo) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery(
                            "SELECT p FROM Posto p " +
                                    "WHERE p.sala.id = (" +
                                    "   SELECT s.sala.id FROM Spettacolo s WHERE s.id = :idSpettacolo" +
                                    ") AND p.id NOT IN (" +
                                    "   SELECT pa.posto.id FROM PostoAcquistato pa WHERE pa.acquisto.spettacolo.id = :idSpettacolo" +
                                    ") ORDER BY p.numero",
                            Posto.class
                    )
                    .setParameter("idSpettacolo", idSpettacolo)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public List<Posto> findAll() {
        EntityManager em = null;
        List<Posto> list = new ArrayList<>();

        try {
            em = JPAUtil.getEntityManager();
            TypedQuery<Posto> query = em.createQuery("SELECT p FROM Posto p", Posto.class);
            list = query.getResultList();
        } catch (Exception e) {
            System.err.println("Errore nel recuperare i posti: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return list;
    }

    public void save(Posto posto) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.persist(posto);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nel salvare il posto: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void update(Posto posto) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.merge(posto);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'aggiornare il posto: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    public void delete(Posto posto) {
        EntityManager em = null;

        try {
            em = JPAUtil.getEntityManager();
            em.getTransaction().begin();
            em.remove(em.merge(posto));
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
            System.err.println("Errore nell'eliminare il posto: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }
}