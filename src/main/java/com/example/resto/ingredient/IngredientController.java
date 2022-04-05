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

@RestController
@RequestMapping(path = "/ingredients")
public class IngredientController {

	@Autowired
	private  IngredientService ingservice;
	
	@GetMapping("/resultDate")
	public ModelAndView resultDateIngredient(Model model, 
			@RequestParam(required = true) String date1,
			@RequestParam(required = true) String date2) throws ParseException{
		Date d1 = new SimpleDateFormat("dd/MM/yyyy").parse(date1);
		Date d2 = new SimpleDateFormat("dd/MM/yyyy").parse(date2);
		
		List<HashMap<String,Object>> liste = ingservice.getIngredientConsomer(d1, d2);
		
		Double sum = 0.0;
		for(int i=0; i<liste.size(); i++) {
			HashMap<String,Object> temp = liste.get(i);
			sum += (Double)temp.get("prixTotal");
		}

		model.addAttribute("sumPrix", sum);
		model.addAttribute("listIngredient", liste);
		model.addAttribute("date1",date1);
		model.addAttribute("date2",date2);
		model.addAttribute("view", "resultDateIngredient");
		return new ModelAndView("template");
	}

	@GetMapping("/choixDate")
	public ModelAndView choixDate(Model model){
		
	model.addAttribute("view","selectDateIngredient");
				return new ModelAndView("template");
	}

        
       
         

}
