package com.example.resto.stock;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(path = "/stock")
public class StockController {
	@Autowired
	private  StockService service;
	public StockController(StockService service) {
	        this.service = service;
	    }
	
	  @GetMapping
		public ModelAndView stockRestant(Model model){
		  List<HashMap<String, Object>> ingredients = service.getAllStockRestant();
		    model.addAttribute("ingredients", ingredients);
		    model.addAttribute("view", "stock");
		    return new ModelAndView("template");
		 }
}
