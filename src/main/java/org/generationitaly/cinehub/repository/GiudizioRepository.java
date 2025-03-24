package org.generationitaly.cinehub.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.generationitaly.cinehub.entity.Giudizio;
import org.generationitaly.cinehub.Util.JPAUtil;

import java.util.ArrayList;
import java.util.List;

public class GiudizioRepository {

	public Giudizio findById(Integer id) {
		EntityManager em = null;
		Giudizio giudizio = null;

		try {
			em = JPAUtil.getEntityManager();
			giudizio = em.find(Giudizio.class, id);
		} catch (Exception e) {
			System.err.println("Errore nel recuperare il giudizio: " + e.getMessage());
		} finally {
			if (em != null) em.close();
		}

		return giudizio;
	}

	public List<Giudizio> findAll() {
		EntityManager em = null;
		List<Giudizio> list = new ArrayList<>();

		try {
			em = JPAUtil.getEntityManager();
			TypedQuery<Giudizio> query = em.createQuery("SELECT g FROM Giudizio g", Giudizio.class);
			list = query.getResultList();
		} catch (Exception e) {
			System.err.println("Errore nel recuperare i giudizi: " + e.getMessage());
		} finally {
			if (em != null) em.close();
		}

		return list;
	}

	public void save(Giudizio giudizio) {
		EntityManager em = null;

		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.persist(giudizio);
			em.getTransaction().commit();
		} catch (Exception e) {
			if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
			System.err.println("Errore nel salvare il giudizio: " + e.getMessage());
		} finally {
			if (em != null) em.close();
		}
	}

	public void update(Giudizio giudizio) {
		EntityManager em = null;

		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.merge(giudizio);
			em.getTransaction().commit();
		} catch (Exception e) {
			if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
			System.err.println("Errore nell'aggiornare il giudizio: " + e.getMessage());
		} finally {
			if (em != null) em.close();
		}
	}

	public void delete(Giudizio giudizio) {
		EntityManager em = null;

		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.remove(em.merge(giudizio));
			em.getTransaction().commit();
		} catch (Exception e) {
			if (em != null && em.getTransaction().isActive()) em.getTransaction().rollback();
			System.err.println("Errore nell'eliminare il giudizio: " + e.getMessage());
		} finally {
			if (em != null) em.close();
		}
	}
}
