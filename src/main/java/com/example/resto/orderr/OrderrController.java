package com.example.resto.orderr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(path = "/order")
public class OrderrController {
	private final OrderrService orderService;
	    
    @Autowired
    public OrderrController(OrderrService orderService){
        this.orderService=orderService;
    }
    @GetMapping(path="/insertPage")
    public ModelAndView insertOrderPage(Model model)
    {
    	ModelAndView mv = new ModelAndView("template");
        model.addAttribute("view", "order");
        return mv;
    }
    @PostMapping(path="/insert")
    public ModelAndView ajout(Model model,@RequestParam String idTable) throws Exception{
        String idOrder = orderService.insertOrder(idTable);
    	ModelAndView mv = new ModelAndView("template");
        model.addAttribute("idOrder", idOrder);
        model.addAttribute("view", "order");
        return mv;
    }    
	    
}
