package org.generationitaly.cinehub.repository;

import jakarta.persistence.*;
import org.generationitaly.cinehub.Util.JPAUtil;
import org.generationitaly.cinehub.entity.Nazione;

import java.util.List;

public class NazioneRepository {

    public List<Nazione> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        List<Nazione> nazioni = em.createQuery("SELECT n FROM Nazione n", Nazione.class).getResultList();
        em.close();
        return nazioni;
    }

    public Nazione findById(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        Nazione nazione = em.find(Nazione.class, id);
        em.close();
        return nazione;
    }

    public Nazione findByNome(String nome) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            TypedQuery<Nazione> query = em.createQuery("SELECT n FROM Nazione n WHERE n.nome = :nome", Nazione.class);
            query.setParameter("nome", nome);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public void save(Nazione nazione) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();

        if (nazione.getId() == 0) {
            em.persist(nazione);
        } else {
            em.merge(nazione);
        }

        tx.commit();
        em.close();
    }

    public void deleteById(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();

        Nazione nazione = em.find(Nazione.class, id);
        if (nazione != null) {
            em.remove(nazione);
        }

        tx.commit();
        em.close();
    }
}
