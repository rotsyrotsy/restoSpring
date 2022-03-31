package com.example.resto.serveur;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServeurService {
	private final ServeurRepository repository;

	   
    @Autowired
    public ServeurService(ServeurRepository repository) {
        this.repository = repository;
    }
    
    public List<Serveur> getAllServeurs(){
		return repository.findAll();
	}
}
