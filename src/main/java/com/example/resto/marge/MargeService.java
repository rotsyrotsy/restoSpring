package com.example.resto.marge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.resto.categorie.Categorie;
import com.example.resto.ingredient.IngredientRepository;
@Service
public class MargeService {
	private final MargeRepository repository;

    @Autowired
    public MargeService(MargeRepository repository) {
        this.repository = repository;
    }
    
    public List<Marge> getAllMarges(){
    	return repository.findAll();
    }
}
