package com.example.resto.ingredient;

import java.text.ParseException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(path = "/ingredients")
public class IngredientController {

	@Autowired
	private  IngredientService service;
	public IngredientController(IngredientService service) {
	        this.service = service;
	    }
        
        @GetMapping("/choixDate")
	public ModelAndView choixDate(Model model){
		
		model.addAttribute("view","selectDateIngredient");
                 return new ModelAndView("template");
        }
         @GetMapping("/resultDate")
	public ModelAndView resultDate(Model model){
		
		model.addAttribute("view","resultDateIngredient");
                 return new ModelAndView("template");
        }

}
