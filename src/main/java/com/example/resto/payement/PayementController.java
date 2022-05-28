package com.example.resto.payement;

import com.example.resto.categorie.Categorie;
import com.example.resto.controlle.Controle;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.resto.formattage.Formattage;
import com.example.resto.order.OrderrController;


@RestController
@RequestMapping(path = "/payement")
public class PayementController {
	@Autowired
	private  PayementService service;
	@Autowired
	private OrderrController ordContr;
	
	public PayementController(PayementService service) {
	        this.service = service;
	    }
	@GetMapping("/select")
	public ModelAndView selectPaiement(Model model){
		model.addAttribute("view","bo_selectPayementByDate");
		return new ModelAndView("back/bo_template");
	}
	@GetMapping("/resultDate")
	public ModelAndView paiementsEntre2Dates(Model model,
			@RequestParam(required = true) java.sql.Date date1,
			 @RequestParam(required = true) java.sql.Date date2)  throws ParseException{

		
                try{
                     Controle.controleDate(date1, date2);
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                    String erreur="<div class=\"alert alert-danger\">"+e.getMessage()+"</div>";
                    model.addAttribute("message",erreur);
                    model.addAttribute("view","bo_resultPayement");
                    return new ModelAndView("back/bo_template");
                }
               
		
		List<Payement> liste = service.findBetween(date1, date2);
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
		model.addAttribute("sumEspece",Formattage.formatePrice(sumEspece));
		model.addAttribute("sumCheque",Formattage.formatePrice(sumCheque));
		model.addAttribute("cheque",cheque);
		model.addAttribute("espece",espece);
		model.addAttribute("sumTotal",Formattage.formatePrice(sumEspece+sumCheque));
		model.addAttribute("view","bo_resultPayement");
				return new ModelAndView("back/bo_template");
	}
	
	@PostMapping("/insert")
    public ModelAndView ajout(Payement paie, Model model,ServletRequest request) throws Exception{
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
        if (session.getAttribute("sessionOrder")!=null) {
        	HashMap<String, Object> order = (HashMap<String, Object>)session.getAttribute("sessionOrder");
        	String idOrder = (String)order.get("idOrder");
        	paie.setIdOrder(idOrder);
        }
        service.insertWithQuery(paie);
        return ordContr.additionNonPaye(model, request);
    }  
	
	
}
