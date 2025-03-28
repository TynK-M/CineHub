package org.generationitaly.cinehub.repository;

import jakarta.persistence.*;
import org.generationitaly.cinehub.Util.JPAUtil;
import org.generationitaly.cinehub.entity.Genere;
import org.hibernate.engine.spi.EntityUniqueKey;

import java.util.List;

public class GenereRepository {
    public List<Genere> findAll(){
        EntityManager em = JPAUtil.getEntityManager();
        List<Genere> generi = em.createQuery("select g from Genere g", Genere.class).getResultList();
        em.close();
        return generi;
    }

    public Genere findById(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        Genere genere = em.find(Genere.class, id);
        em.close();
        return genere;
    }

    public Genere fingByNome(String nome) {
        EntityManager em = JPAUtil.getEntityManager();
        try{
            TypedQuery<Genere> risposta = em.createQuery("select g from Genere g where g.nome = :nome", Genere.class);
            risposta.setParameter("nome", nome);
            return risposta.getSingleResult();
        } catch(NoResultException e){
            return null;
        } finally {
            em.close();
        }
    }

    public void save(Genere genere) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();


        if(genere.getId() == 0){
            // salvataggio (o inserimento, come vuoi)
            em.persist(genere);
        } else {
            // aggiornamento
            em.merge(genere);
        }
    }

    public void deleteById(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();

        Genere genere = em.find(Genere.class, id);
        if(genere != null){
            em.remove(genere);
        }

        tx.commit();
        em.close();
    }
}
