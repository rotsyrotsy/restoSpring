package com.example.resto.order;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.resto.detailsOrder.DetailsOrderService;
@RestController
@RequestMapping(path = "/order")
public class OrderrController {
	@Autowired
	private  DetailsOrderService doservice;
	
	@Autowired
	private  OrderrService service;
	public OrderrController(OrderrService service) {
	        this.service = service;
	    }
	
	@GetMapping("/validerCommande")
	public ModelAndView resultServeur(Model model, 
			@RequestParam(required = true) String idOrder) throws ParseException{
		doservice.validerCommande(idOrder);
		List<HashMap<String,Object>> liste = doservice.getprixPlatOrderByIdOrder(idOrder);
		
	    model.addAttribute("platCommande", liste);
	    model.addAttribute("view", "listeValide");
	    return new ModelAndView("template");
	 }
}
