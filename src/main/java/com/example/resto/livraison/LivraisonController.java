package com.example.resto.livraison;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.resto.serveur.Serveur;
import com.example.resto.serveur.ServeurService;


@RestController
@RequestMapping(path = "/livrer")
public class LivraisonController {
	
	 @GetMapping
	 public ModelAndView livrer(Model models){
                models.addAttribute("view", "livrer");
                return new ModelAndView("template");
         }
		
	
}
