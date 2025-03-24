package org.generationitaly.cinehub.repository;

import java.util.ArrayList;
import java.util.List;

import org.generationitaly.cinehub.Util.JPAUtil;
import org.generationitaly.cinehub.entity.Film;
import org.generationitaly.cinehub.entity.Giudizio;

import jakarta.persistence.EntityManager;

public class GiudizioRepository {
	public Giudizio findById(Integer id) {
	    EntityManager em = null;
	    Giudizio giudizio = null;
	    try {
	        giudizio = em.find(Giudizio.class, id);
	    } catch (Exception e) {
	        System.err.println(e.getMessage());
	    } finally {
	        if (em != null && em.isOpen()) {
	            em.close();  
	        }
	    }
	    return giudizio;
	}
	
	public List<Giudizio> findAll() {
	    EntityManager em = null;
	    List<Giudizio> giudizi = new ArrayList<>();
	    try {
	        giudizi = em.createQuery("SELECT g FROM Giudizio g", Giudizio.class).getResultList();
	    } catch (Exception e) {
	        System.err.println("Errore durante il recupero di tutti i giudizi: " + e.getMessage());
	    } finally {
	        if (em != null && em.isOpen()) {
	            em.close();  // Chiude l'EntityManager per evitare memory leak
	        }
	    }
	    return giudizi;
	    
	}
	
	public void save(Giudizio giudizio) {
	    EntityManager em = null;

	    try {
	        em = JPAUtil.getEntityManager();
	        em.getTransaction().begin();
	        em.persist(giudizio);
	        em.getTransaction().commit();
	    } catch (Exception e) {
	        if (em != null && em.getTransaction().isActive()) {
	            em.getTransaction().rollback();
	        }
	        System.err.println("Errore nel salvare il giudizio: " + e.getMessage());
	    } finally {
	        if (em != null) {
	            em.close();
	        }
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
	        if (em != null && em.getTransaction().isActive()) {
	            em.getTransaction().rollback();
	        }
	        System.err.println("Errore nell'aggiornare il giudizio: " + e.getMessage());
	    } finally {
	        if (em != null) {
	            em.close();
	        }
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
            System.err.println("Errore nell'eliminare il giudizio" + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    } 
}

