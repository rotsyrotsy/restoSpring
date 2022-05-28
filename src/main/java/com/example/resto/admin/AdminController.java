package com.example.resto.admin;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
@RequestMapping(path = "/admin")
public class AdminController {
	private final AdminService service;
	
	@Autowired
	public AdminController(AdminService service) {
		this.service = service;
	}
	 
	
	 @GetMapping
	 public ModelAndView login(Model model){
	    return new ModelAndView("back/bo_login");
	 }
	 
	 @GetMapping("/forbidden")
	 public ModelAndView forbidden(Model model){
	    return new ModelAndView("error500");
	 }
	 
	 @PostMapping("/login")
     public @ResponseBody ModelAndView login(Admin adm, Model model,ServletRequest request)
     {
			try {

				Admin val = service.find(adm).get();
				
				HttpServletRequest req = (HttpServletRequest) request;
				HttpSession session = req.getSession();
				session.setAttribute("sessionAdministrateur", val);
				
				model.addAttribute("admin", val);
				
        	    model.addAttribute("view","bo_selectConsomIngredient");
        	    return new ModelAndView("back/bo_template");
        	        
			}catch(Exception e) {
				model.addAttribute("erreur", e.getMessage());
				return new ModelAndView("back/bo_login");
			}
     }

     @GetMapping("/logout")
     public ModelAndView logout(Model model,ServletRequest request)
     {
    	HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		session.invalidate();
		return new ModelAndView("back/bo_login");
     }
     
}
