package org.generationitaly.cinehub.repository;

import jakarta.persistence.EntityManager;
import org.generationitaly.cinehub.entity.Film;
import org.generationitaly.cinehub.util.JPAUtil;

import java.util.List;

public class FilmRepository {

    public Film findById(Integer id) {
        EntityManager em = JPAUtil.getEntityManager();
        Film film = em.find(Film.class, id);
        em.close();
        return film;
    }

    public List<Film> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        List<Film> list = em.createQuery("SELECT f FROM Film f", Film.class).getResultList();
        em.close();
        return list;
    }

    public void save(Film film) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        em.persist(film);
        em.getTransaction().commit();
        em.close();
    }

    public void update(Film film) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        em.merge(film);
        em.getTransaction().commit();
        em.close();
    }

    public void delete(Film film) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        em.remove(em.merge(film));
        em.getTransaction().commit();
        em.close();
    }
}
