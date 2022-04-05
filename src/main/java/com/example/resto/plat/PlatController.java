package com.example.resto.plat;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.resto.categorie.Categorie;
import com.example.resto.categorie.CategorieService;

@RestController
@RequestMapping(path = "/plats")
public class PlatController {

	@Autowired
	private  PlatService service;
	public PlatController(PlatService service) {
	        this.service = service;
	    }
	
	@Autowired
	private  CategorieService catService;
	 
	 @GetMapping
	 public ModelAndView getListePlats(Model model, @RequestParam(required = false) String categorie){
		 List<HashMap<String, Object>> listPlat = service.getAllPlats();
		 
		 if (categorie!=null ) {
			 if (!categorie.isEmpty() && categorie.compareToIgnoreCase("tous")!=0) {
					listPlat = service.getPlatByCategorie(categorie);
					model.addAttribute("misyCat", 1);
			 }
		 }
		 
         List<Categorie> listCategorie = catService.getAllCategories();
		model.addAttribute("listPlat", listPlat);
	    model.addAttribute("listCategorie", listCategorie);
	    model.addAttribute("view", "menu");
	    return new ModelAndView("template");
	 }
        
	 @GetMapping("index")
	 public ModelAndView getIndex(Model model){

     	    model.addAttribute("view", "index");
     	    return new ModelAndView("template");
	 }
         
     @GetMapping("prix-plat")
	 public ModelAndView getPrixAllPlats(Model model){
		 List<HashMap<String, Object>> listPlat = service.getPrixAllPlats();
		 
		model.addAttribute("prixDeRevientPlat", listPlat);
	    model.addAttribute("view", "listPrixDeRevient");
	    return new ModelAndView("template");
	 }
     
     @GetMapping("prix-plat-base")
	 public ModelAndView getPrixAllPlatsBase(Model model){
		 List<HashMap<String, Object>> listPlat = service.getPrixAllPlatsBase();
		 
		model.addAttribute("prixDeRevientPlat", listPlat);
	    model.addAttribute("view", "listPrixDeRevient");
	    return new ModelAndView("template");
	 }
         
     @GetMapping("/getPlatIngredient")
     public ModelAndView getSignalementById(Model model, @RequestParam String idPlat) {
    	 List<HashMap<String, Object>> listIng = service.getAllIngredient(idPlat);
    	 
    	 model.addAttribute("platIngredient",listIng);
    	 model.addAttribute("view","detailPlat");
    	 return new ModelAndView("template");
     }
       

}
