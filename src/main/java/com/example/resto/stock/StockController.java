package com.example.resto.stock;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.resto.controlle.Controle;

@RestController
@RequestMapping(path = "/stock")
public class StockController {
	@Autowired
	private  StockService service;
	public StockController(StockService service) {
	        this.service = service;
	    }
	
	  @GetMapping
		public ModelAndView stockRestant(Model model,ServletRequest request){
			if (!Controle.isAdmin(request)) {
				return new ModelAndView("error500");
			}
		  List<HashMap<String, Object>> ingredients = service.getAllStockRestant();
		    model.addAttribute("ingredients", ingredients);
		    model.addAttribute("view", "bo_stock");
		    return new ModelAndView("back/bo_template");
		 }
}
