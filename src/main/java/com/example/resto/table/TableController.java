package com.example.resto.table;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.resto.serveur.Serveur;
import com.example.resto.serveur.ServeurService;


@RestController
@RequestMapping(path = "/tables")
public class TableController {

	@Autowired
	private  TableService service;
	public TableController(TableService service) {
	        this.service = service;
	    }
	

	@Autowired
	private  ServeurService servservice;
	
	 @GetMapping
	 public ModelAndView getAllTableOrder(Model models){
		 List<Serveur> listeServeurs = servservice.getAllServeurs();
			
		 List<HashMap<String,Object>> listTable = service.selectFromIdTable();
		 List<HashMap<String,Object>> listTableOrder = service.lastOrderByTable();

		    models.addAttribute("listServeur", listeServeurs);
		models.addAttribute("listTableOrder", listTableOrder);
		models.addAttribute("listTable", listTable);
                models.addAttribute("view", "selectTable");
                return new ModelAndView("template");
         }
		
	
}
