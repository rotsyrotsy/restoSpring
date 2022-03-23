package com.example.resto.categorie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CategorieService {
	private final CategorieRepository repository;

	   
    @Autowired
    public CategorieService(CategorieRepository repository) {
        this.repository = repository;
    }
    
    public List<Categorie> getAllCategories(){
		return repository.findAll();
	}
}
