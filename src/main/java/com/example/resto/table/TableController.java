package com.example.resto.table;

import java.util.HashMap;
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
	
	
	 @GetMapping("/allTables")
	 public ModelAndView getAllTable(Model models){
		 List<IdTable> listTable = service.getAllTable();
		 
		models.addAttribute("listTable", listTable);
                models.addAttribute("view", "selectTable");
                return new ModelAndView("template");
         }
	 
	 @GetMapping
	 public ModelAndView getAllTableOrder(Model models){
		 List<HashMap<String,Object>> listTable = service.selectFromIdTable();
		 List<HashMap<String,Object>> listTableOrder = service.lastOrderByTable();

		models.addAttribute("listTableOrder", listTableOrder);
		models.addAttribute("listTable", listTable);
                models.addAttribute("view", "selectTable");
                return new ModelAndView("template");
         }
		
	
}
