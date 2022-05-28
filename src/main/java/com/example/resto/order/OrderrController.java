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
import com.example.resto.serveur.Serveur;
import com.example.resto.serveur.ServeurService;
import com.example.resto.table.TableController;
import com.example.resto.table.TableService;
@RestController
@RequestMapping(path = "/order")
public class OrderrController {

	@Autowired 
	private TableController tableController; 
	
	@Autowired
	private  PlatService platservice;
	
	@Autowired
	private  CategorieService catService;

	@Autowired
	private  TableService tabService;
	
	@Autowired
	private  DetailsOrderService doservice;
	
	@Autowired
	private  ServeurService servservice;
	
	@Autowired
	private  OrderrService service;
	public OrderrController(OrderrService service) {
	        this.service = service;
	    }
    @PostMapping(path="/insert")
    public ModelAndView ajout(Model model,@RequestParam String idTable, @RequestParam String idServeur, 
    		@RequestParam(required = false) String categorie
    		,ServletRequest request) throws Exception{
    	HashMap<String, Object> idOrder = service.insertOrder(idTable,idServeur);
        
        
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
    public ModelAndView getAddition(Model model,@RequestParam String idTable,ServletRequest request) throws Exception{
    
    	ModelAndView mv = new ModelAndView("template");
    	
    	HashMap<String, Object> lastOrder =  service.lastOrderByTable(idTable);
    	List<HashMap<String, Object>> listPlat = platservice.getAllPlats();
    	
    	if (lastOrder.size()>0) {
    		 List<Categorie> listCategorie = catService.getAllCategories();
    			model.addAttribute("listPlat", listPlat);
    		    model.addAttribute("listCategorie", listCategorie);
    		    
    	        model.addAttribute("sessionOrder", lastOrder);
    	        
    			HttpServletRequest req = (HttpServletRequest) request;
    			HttpSession session = req.getSession();
    			session.setAttribute("sessionOrder", lastOrder);
    	        
    	        
    	        model.addAttribute("view", "menu");
    	}else {
    		
    	
    	List<Serveur> listeServeurs = servservice.getAllServeurs();
		
		 List<HashMap<String,Object>> listTable = tabService.selectFromIdTable();

		 model.addAttribute("erreur", "Il n'y a pas encore eu de commande sur cette table.");
		 model.addAttribute("listServeur", listeServeurs);
		 model.addAttribute("listTable", listTable);
		 model.addAttribute("view", "selectTable");
        }
       
        return mv;
    }  
    

	@GetMapping("/commandeEnCours")
	public ModelAndView commandeEnCours(Model model, 
			ServletRequest request) throws ParseException{
		
		String idOrder = null;
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
        if (session.getAttribute("sessionOrder")!=null) {
        	HashMap<String, Object> order = (HashMap<String, Object>)session.getAttribute("sessionOrder");
        	idOrder = (String)order.get("idOrder");
        }
		List<HashMap<String,Object>> nonvalide = service.commandeEnCoursParOrder(idOrder);
		List<HashMap<String,Object>> valide = service.commandeValideParOrder(idOrder);
		List<HashMap<String,Object>> pret = service.commandePretParOrder(idOrder);
		
	    model.addAttribute("nonvalide", nonvalide);
	    model.addAttribute("valide", valide);
	    model.addAttribute("pret", pret);
	    model.addAttribute("view", "commandeEnCours");
	    return new ModelAndView("template");
	 }
    
	@GetMapping("/validerCommande")
	public ModelAndView resultServeur(Model model, 
			ServletRequest request) throws ParseException{
		
		String idOrder = null;
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
        if (session.getAttribute("sessionOrder")!=null) {
        	HashMap<String, Object> order = (HashMap<String, Object>)session.getAttribute("sessionOrder");
        	idOrder = (String)order.get("idOrder");
        	doservice.validerCommande(idOrder);
        }
		return this.commandeEnCours(model, request);
		/*List<HashMap<String,Object>> liste = doservice.getprixPlatOrderByIdOrder(idOrder);
		
	    model.addAttribute("platCommande", liste);
	    model.addAttribute("view", "platCommande");
	    return new ModelAndView("template");*/
	 }
        
        @GetMapping("/additionNonPaye")
	public ModelAndView additionNonPaye(Model model,ServletRequest request){
        	
        List<HashMap<String,Object>> liste = service.getAdditionNonPaye();	
        
        	HttpServletRequest req = (HttpServletRequest) request;
    		HttpSession session = req.getSession();
            if (session.getAttribute("sessionOrder")!=null) {
            	HashMap<String, Object> order = (HashMap<String, Object>)session.getAttribute("sessionOrder");
            	String idOrder = (String)order.get("idOrder");
            	liste = service.getAdditionParTable(idOrder);
            }
            
		
	    model.addAttribute("addition", liste);
	    model.addAttribute("view", "additionNonPaye");
	    return new ModelAndView("template");
	 }
        
        @GetMapping("/boAdditionNonPaye")
    	public ModelAndView boAdditionNonPaye(Model model){
    		List<HashMap<String,Object>> liste = service.getAdditionNonPaye();
    		
    	    model.addAttribute("addition", liste);
    	    model.addAttribute("view", "bo_additionNonPaye");
    	    return new ModelAndView("back/bo_template");
    	 }
        
        
        @GetMapping("/logoutIdOrder")
        public ModelAndView logoutIdOrder(Model model,ServletRequest request)
        {
	       	HttpServletRequest req = (HttpServletRequest) request;
	   		HttpSession session = req.getSession();
	   		session.invalidate();
	   		return tableController.getAllTableOrder(model);
        }
        
}
