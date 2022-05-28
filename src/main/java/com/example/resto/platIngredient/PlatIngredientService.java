package com.example.resto.platIngredient;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PlatIngredientService {
	
	private final PlatIngredientRepository repository;
	@PersistenceContext
    private EntityManager entityManager;
	   
    @Autowired
    public PlatIngredientService(PlatIngredientRepository repository) {
        this.repository = repository;
    }
    
    @Transactional
    public void insertWithQuery(Platingredient pi) {
    try {
    	 entityManager.createNativeQuery("INSERT INTO platingredient VALUES ('PI' || nextval('seqplatingredient'),?,?,?)")
    	 .setParameter(1, pi.getIdplat())
    	 .setParameter(2, pi.getIdingredient())
         .setParameter(3, pi.getQuantity())
         .executeUpdate(); 	
    	}
    catch(Exception e) {e.printStackTrace();}
    }
}
