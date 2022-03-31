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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.resto.categorie.Categorie;
import com.example.resto.categorie.CategorieService;
import com.example.resto.detailsOrder.DetailsOrderService;
import com.example.resto.plat.PlatService;
@RestController
@RequestMapping(path = "/order")
public class OrderrController {

	@Autowired
	private  PlatService platservice;
	
	@Autowired
	private  CategorieService catService;
	
	@Autowired
	private  DetailsOrderService doservice;
	
	@Autowired
	private  OrderrService service;
	public OrderrController(OrderrService service) {
	        this.service = service;
	    }
    @PostMapping(path="/insert")
    public ModelAndView ajout(Model model,@RequestParam String idTable, @RequestParam(required = false) String categorie) throws Exception{
        String idOrder = service.insertOrder(idTable);
    	ModelAndView mv = new ModelAndView("template");
    	
    	List<HashMap<String, Object>> listPlat = platservice.getAllPlats();
		 
		 if (categorie!=null ) {
			 if (!categorie.isEmpty() && categorie.compareToIgnoreCase("tous")!=0) {
					listPlat = platservice.getPlatByCategorie(categorie);
					model.addAttribute("misyCat", 1);
			 }
		 }
		 
        List<Categorie> listCategorie = catService.getAllCategories();
		model.addAttribute("listPlat", listPlat);
	    model.addAttribute("listCategorie", listCategorie);
	    
        model.addAttribute("idOrder", idOrder);
        model.addAttribute("view", "menu");
        return mv;
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
