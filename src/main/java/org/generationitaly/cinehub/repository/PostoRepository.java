package org.generationitaly.cinehub.repository;

import java.util.List;

import org.generationitaly.cinehub.Util.JPAUtil;
import org.generationitaly.cinehub.entity.Posto;

import jakarta.persistence.EntityManager;

public class PostoRepository {

	public Posto findById(Integer id) {
		EntityManager em = null;
		Posto posto = null;

		try {
			em = JPAUtil.getEntityManager();
			posto = em.find(Posto.class, id);
		} catch (Exception e) {
			System.err.println("Errore nel trovare il posto  " + e.getMessage());
		} finally {
			if (em != null) {
				em.close();
			}
		}

		return posto;
	}
	
	public List<Posto> findAll() {
	    EntityManager em = null;
	    List<Posto> posti = null;

	    try {
	        em = JPAUtil.getEntityManager();
	        posti = em.createQuery("SELECT p FROM Posto p", Posto.class).getResultList();  
	    } catch (Exception e) {
	        System.err.println("Errore nel recuperare tutti i posti: " + e.getMessage());
	    } finally {
	        if (em != null) {
	            em.close();  
	        }
	    }

	    return posti;
	}
	
	public void save(Posto posto) {
	    EntityManager em = null;

	    try {
	        em = JPAUtil.getEntityManager();
	        em.getTransaction().begin();
	        em.persist(posto);  
	        em.getTransaction().commit();
	    } catch (Exception e) {
	        if (em != null && em.getTransaction().isActive()) {
	            em.getTransaction().rollback(); 
	        }
	        System.err.println("Errore nel salvare il posto: " + e.getMessage());
	    } finally {
	        if (em != null) {
	            em.close();  
	        }
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
	        if (em != null && em.getTransaction().isActive()) {
	            em.getTransaction().rollback();  
	        }
	        System.err.println("Errore nell'aggiornare il posto: " + e.getMessage());
	    } finally {
	        if (em != null) {
	            em.close();  
	        }
	    }
	}
	
	public void delete(Posto posto) {
	    EntityManager em = null;

	    try {
	        em = JPAUtil.getEntityManager();
	        em.getTransaction().begin();
	        posto = em.merge(posto);  
	        em.remove(posto);  
	        em.getTransaction().commit();
	    } catch (Exception e) {
	        if (em != null && em.getTransaction().isActive()) {
	            em.getTransaction().rollback();  
	        }
	        System.err.println("Errore nell'eliminare il posto: " + e.getMessage());
	    } finally {
	        if (em != null) {
	            em.close();  
	        }
	    }
	}
}
