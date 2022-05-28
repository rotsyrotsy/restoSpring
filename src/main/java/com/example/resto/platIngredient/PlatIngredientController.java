package com.example.resto.platIngredient;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.resto.fileUpload.FileUploadUtil;
import com.example.resto.ingredient.Ingredient;
import com.example.resto.ingredient.IngredientService;
import com.example.resto.plat.Plat;
import com.example.resto.plat.PlatService;


@RestController
@RequestMapping(path = "/platIngredients")
public class PlatIngredientController {
	@Autowired
	private  PlatService platServ;
	

	@Autowired
	private  IngredientService ingrServ;
	
	@Autowired
	private  PlatIngredientService service;
	public PlatIngredientController(PlatIngredientService service) {
	        this.service = service;
	    }
	
	 @GetMapping
     public ModelAndView formulaireAjout(Model model) {
         List<Plat> plats = platServ.getPlats();
         List<Ingredient> ingredients = ingrServ.getIngredients();
         
	    model.addAttribute("plats", plats);
	    model.addAttribute("ingredients", ingredients);
    	 model.addAttribute("view","bo_ajoutPlatIngredient");
    	 return new ModelAndView("back/bo_template");
     }
	 
	 @PostMapping
     public @ResponseBody ModelAndView insert(Model model,Platingredient pi ) 
     {
         service.insertWithQuery(pi);
  
         model.addAttribute("success","L'ingrédient a été ajouté au plat.");
         return this.formulaireAjout(model);
     }
}
