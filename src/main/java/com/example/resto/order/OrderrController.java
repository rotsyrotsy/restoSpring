package com.example.resto.order;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.resto.categorie.Categorie;
import com.example.resto.categorie.CategorieService;
import com.example.resto.controlle.Controle;
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
    public ModelAndView ajout(Model model,@RequestParam String idTable, @RequestParam String idServeur, 
    		@RequestParam(required = false) String categorie
    		,ServletRequest request) throws Exception{
        String idOrder = service.insertOrder(idTable,idServeur);
        
        
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
	    
        model.addAttribute("sessionOrder", idOrder);
        
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		session.setAttribute("sessionOrder", idOrder);
        
        
        model.addAttribute("view", "menu");
        return mv;
    }  
    
    @GetMapping()
    public ModelAndView getAddition(Model model,@RequestParam String idOrder,ServletRequest request) throws Exception{
    
    	ModelAndView mv = new ModelAndView("template");
    	
    	List<HashMap<String, Object>> listPlat = platservice.getAllPlats();
		 
        List<Categorie> listCategorie = catService.getAllCategories();
		model.addAttribute("listPlat", listPlat);
	    model.addAttribute("listCategorie", listCategorie);
	    
        model.addAttribute("sessionOrder", idOrder);
        
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		session.setAttribute("sessionOrder", idOrder);
        
        
        model.addAttribute("view", "menu");
        return mv;
    }  
    
	@GetMapping("/validerCommande")
	public ModelAndView resultServeur(Model model, 
			ServletRequest request) throws ParseException{
		
		String idOrder = null;
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
        if (session.getAttribute("sessionOrder")!=null) {
        	idOrder = (String) session.getAttribute("sessionOrder");
        	doservice.validerCommande(idOrder);
        }
		
		List<HashMap<String,Object>> liste = doservice.getprixPlatOrderByIdOrder(idOrder);
		
	    model.addAttribute("platCommande", liste);
	    model.addAttribute("view", "platCommande");
	    return new ModelAndView("template");
	 }
        
        @GetMapping("/additionNonPaye")
	public ModelAndView additionNonPaye(Model model){
		List<HashMap<String,Object>> liste = service.getAdditionNonPaye();
		
	    model.addAttribute("addition", liste);
	    model.addAttribute("view", "additionNonPaye");
	    return new ModelAndView("template");
	 }
        
        @GetMapping("/boAdditionNonPaye")
    	public ModelAndView boAdditionNonPaye(Model model,ServletRequest request){
    		if (!Controle.isAdmin(request)) {
    			return new ModelAndView("error500");
    		}
    		List<HashMap<String,Object>> liste = service.getAdditionNonPaye();
    		
    	    model.addAttribute("addition", liste);
    	    model.addAttribute("view", "bo_additionNonPaye");
    	    return new ModelAndView("back/bo_template");
    	 }
	
}
