package com.example.resto.table;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
@RequestMapping(path = "/tables")
public class TableController {

	@Autowired
	private  TableService service;
	public TableController(TableService service) {
	        this.service = service;
	    }
	
	
	 @GetMapping
	 public ModelAndView getAllTable(Model models){
		 List<Tables> listTable = service.getAllTable();
		 
		models.addAttribute("listTable", listTable);
                models.addAttribute("view", "selectTable");
                return new ModelAndView("template");
         }
		
	
}
