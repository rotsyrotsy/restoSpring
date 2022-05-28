package com.example.resto.ingredient;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.resto.categorie.CategorieService;
import com.example.resto.formattage.Formattage;
import com.example.resto.controlle.Controle;

@RestController
@RequestMapping(path = "/ingredients")
public class IngredientController {

	@Autowired
	private  IngredientService ingservice;
	
	@GetMapping("/resultDate")
	public ModelAndView resultDateIngredient(Model model, 
			@RequestParam(required = true) java.sql.Date date1,
			@RequestParam(required = true) java.sql.Date date2) throws ParseException{

                 try{
                     Controle.controleDate(date1, date2);
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                    String erreur="<div class=\"alert alert-danger\">"+e.getMessage()+"</div>";
                    model.addAttribute("message",erreur);
                    model.addAttribute("view","bo_resultConsomIngredient");
                    return new ModelAndView("back/bo_template");
                }
		
		List<HashMap<String,Object>> liste = ingservice.getIngredientConsomer(date1, date2);
		
		Double sum = 0.0;
		for(int i=0; i<liste.size(); i++) {
			HashMap<String,Object> temp = liste.get(i);
			sum += (Double)temp.get("prixTotal");
		}

		model.addAttribute("sumPrix", Formattage.formatePrice(sum));
		model.addAttribute("listIngredient", liste);
		model.addAttribute("date1",date1);
		model.addAttribute("date2",date2);
		model.addAttribute("view", "bo_resultConsomIngredient");
		return new ModelAndView("back/bo_template");
	}

	@GetMapping("/choixDate")
	public ModelAndView choixDate(Model model){
			model.addAttribute("view","bo_selectConsomIngredient");
			return new ModelAndView("back/bo_template");
		
	
	}
        
        @GetMapping("/formAchatIngredient")
	public ModelAndView formAchatIngredient(Model model,ServletRequest request){
            if (!Controle.isAdmin(request)) {
				return new ModelAndView("error500");
			}
            
                  List<Ingredient> liste = ingservice.getAllIngredients();

                        model.addAttribute("listIng", liste);
			model.addAttribute("view","bo_achatIngredient");
			return new ModelAndView("back/bo_template");
		
	
	}
          @GetMapping("/achat")
	public ModelAndView achatIngredient(Model model,ServletRequest request,@RequestParam(required = true) String idIng,
                @RequestParam(required = true) Double qte,
                @RequestParam(required = true) java.sql.Date date){
            if (!Controle.isAdmin(request)) {
				return new ModelAndView("error500");
			}
            
                       
            ingservice.acheterIngredients(idIng,qte,date);

                  List<Ingredient> liste = ingservice.getAllIngredients();

                        model.addAttribute("message","Achat d'Ingredients correctement effectué");
                        model.addAttribute("listIng", liste);
			model.addAttribute("view","bo_achatIngredient");
			return new ModelAndView("back/bo_template");
		
	
	}
        

        
       
         

}
