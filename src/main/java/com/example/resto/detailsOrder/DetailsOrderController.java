package com.example.resto.detailsOrder;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.resto.categorie.Categorie;
import com.example.resto.categorie.CategorieService;
import com.example.resto.serveur.Serveur;
import com.example.resto.serveur.ServeurService;

@RestController
@RequestMapping(path = "/detailsOrders")
public class DetailsOrderController {
	@Autowired
	private  DetailsOrderService service;
	
	@Autowired
	private  ServeurService servservice;
	
	public DetailsOrderController(DetailsOrderService service) {
	        this.service = service;
	    }
	
	@GetMapping
	public ModelAndView selectServeur(Model model){
		List<Serveur> listeServeurs = servservice.getAllServeurs();
		
	    model.addAttribute("listServeur", listeServeurs);
	    model.addAttribute("view", "selectPourboire");
	    return new ModelAndView("template");
	 }
	

	@GetMapping("/choixServeur")
	public ModelAndView resultServeur(Model model, 
			@RequestParam(required = true) String serveur,
			 @RequestParam(required = true) String date1,
			 @RequestParam(required = true) String date2) throws ParseException{
		Date d1 = new SimpleDateFormat("dd/MM/yyyy").parse(date1);
		Date d2 = new SimpleDateFormat("dd/MM/yyyy").parse(date2);
		
		List<HashMap<String,Object>> liste = service.groupByIdOrder(serveur, d1,d2);
		
		Double sum = 0.0;
		for(int i=0; i<liste.size(); i++) {
			HashMap<String,Object> temp = liste.get(i);
			sum += (Double)temp.get("pourcentage");
		}
		model.addAttribute("sum",sum);
	    model.addAttribute("listOrder", liste);
	    model.addAttribute("view", "resultPourboire");
	    return new ModelAndView("template");
	 }
	
	@GetMapping("/choixServeurBase")
	public ModelAndView resultServeur2(Model model, 
			@RequestParam(required = true) String serveur,
			 @RequestParam(required = true) String date1,
			 @RequestParam(required = true) String date2) throws ParseException{
		Date d1 = new SimpleDateFormat("dd/MM/yyyy").parse(date1);
		Date d2 = new SimpleDateFormat("dd/MM/yyyy").parse(date2);
		
		List<HashMap<String,Object>> liste = service.getPrixOrderServeur(serveur, d1, d2);
		
		Double sum = 0.0;
		for(int i=0; i<liste.size(); i++) {
			HashMap<String,Object> temp = liste.get(i);
			sum += (Double)temp.get("pourcentage");
		}
		model.addAttribute("sum",sum);
	    model.addAttribute("listOrder", liste);
	    model.addAttribute("view", "resultPourboire");
	    return new ModelAndView("template");
	 }
	
    @PostMapping(path="/insert")
    public ModelAndView ajout(Model model,@RequestParam String idPlat,@RequestParam String idServeur) throws Exception{
        service.insertDetailsOrder(idPlat,idServeur);
    	ModelAndView mv = new ModelAndView("template");
        model.addAttribute("view", "order");
        return mv;
    }    
	
	
}
