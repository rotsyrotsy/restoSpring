package com.example.resto.serveur;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/serveurs")
public class ServeurController {
	@Autowired
	private  ServeurService service;
	public ServeurController(ServeurService service) {
	        this.service = service;
	    }
	
	@GetMapping
	public List<Serveur> getAllServeurs() {
		return service.getAllServeurs();
	}
	
}
