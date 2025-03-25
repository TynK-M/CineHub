package org.generationitaly.cinehub.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import org.generationitaly.cinehub.entity.Film;
import org.generationitaly.cinehub.entity.Giudizio;
import org.generationitaly.cinehub.Util.JPAUtil;
import org.generationitaly.cinehub.entity.Utente;

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

	public List<Giudizio> findByFilm(Film film) {
		EntityManager em = null;
		List<Giudizio> giudizi = null;

		try {
			em = JPAUtil.getEntityManager();
			// JOIN FETCH per caricare anche l'utente
			giudizi = em.createQuery("SELECT g FROM Giudizio g JOIN FETCH g.utente WHERE g.film = :film", Giudizio.class)
					.setParameter("film", film)
					.getResultList();
		} catch (Exception e) {
			System.err.println("Errore nel recuperare i giudizi: " + e.getMessage());
		} finally {
			if (em != null) em.close();
		}

		return giudizi;
	}

	public List<Giudizio> findByUtente(Utente utente) {
		EntityManager em = null;
		List<Giudizio> giudizi = new ArrayList<>();

		try {
			em = JPAUtil.getEntityManager();
			giudizi = em.createQuery(
							"SELECT g FROM Giudizio g JOIN FETCH g.film WHERE g.utente = :utente", Giudizio.class)
					.setParameter("utente", utente)
					.getResultList();
		} catch (Exception e) {
			System.err.println("Errore nel recuperare i giudizi per utente: " + e.getMessage());
		} finally {
			if (em != null) em.close();
		}

		return giudizi;
	}

	public Giudizio findByUtenteAndFilm(Utente utente, Film film) {
		EntityManager em = null;
		Giudizio giudizio = null;

		try {
			em = JPAUtil.getEntityManager();
			giudizio = em.createQuery(
							"SELECT g FROM Giudizio g WHERE g.utente = :utente AND g.film = :film", Giudizio.class)
					.setParameter("utente", utente)
					.setParameter("film", film)
					.getSingleResult();
		} catch (NoResultException e) {
			// Nessuna recensione trovata
		} catch (Exception e) {
			System.err.println("Errore nel trovare il giudizio: " + e.getMessage());
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
