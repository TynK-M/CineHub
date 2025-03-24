package org.generationitaly.cinehub.Util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtil {

    private static final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("cinehub-unit");

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}
