package com.example.resto.payement;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
@RequestMapping(path = "/payement")
public class PayementController {
	@Autowired
	private  PayementService service;
	public PayementController(PayementService service) {
	        this.service = service;
	    }
	@GetMapping
	public ModelAndView selectPaiement(Model model) {
		model.addAttribute("view","selectPayementByDate");
		return new ModelAndView("template");
	}
	@GetMapping("/resultDate")
	public ModelAndView paiementsEntre2Dates(Model model,
			@RequestParam(required = true) String date1,
			 @RequestParam(required = true) String date2) throws ParseException{
		
		Date d1 =  new SimpleDateFormat("dd/MM/yyyy").parse(date1);
		Date d2 =  new SimpleDateFormat("dd/MM/yyyy").parse(date2);
		
		List<Payement> liste = service.findBetween(d1, d2);
		List<Payement> cheque = new ArrayList<Payement>();
		List<Payement> espece = new ArrayList<Payement>();
		for(Payement paie: liste) {
			if (paie.getType().compareTo("espece")==0) {
				espece.add(paie);
			}else if(paie.getType().compareTo("cheque")==0) {
				cheque.add(paie);
			}
		}

		double sumEspece = service.sumPayement(espece);
		double sumCheque = service.sumPayement(cheque);

		model.addAttribute("date1",date1);
		model.addAttribute("date2",date2);
		model.addAttribute("sumEspece",sumEspece);
		model.addAttribute("sumCheque",sumCheque);
		model.addAttribute("cheque",cheque);
		model.addAttribute("espece",espece);
		model.addAttribute("sumTotal",sumEspece+sumCheque);
		model.addAttribute("view","resultPayement");
				return new ModelAndView("template");
	}
}
