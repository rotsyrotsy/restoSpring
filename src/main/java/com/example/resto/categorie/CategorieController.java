package com.example.resto.categorie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(path = "/categories")
public class CategorieController {

	@Autowired
	private  CategorieService service;
	public CategorieController(CategorieService service) {
	        this.service = service;
	    }
	

}
