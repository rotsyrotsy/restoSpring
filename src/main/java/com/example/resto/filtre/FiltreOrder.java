package com.example.resto.filtre;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.example.resto.controlle.Controle;

@Component
@Order(2)
public class FiltreOrder implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        if (!Controle.thereIsOrder(request)) {
        	String baseURL = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort();
        	res.sendRedirect(baseURL+"/plats");
		}else {
			chain.doFilter(request, response);
		}
        
        	
        
	}
	
	@Bean(name="loggingFilter2")
	public FilterRegistrationBean<Filter> loggingFilter(){
	    FilterRegistrationBean<Filter> registrationBean 
	      = new FilterRegistrationBean<>();
	        
	    registrationBean.setFilter(new FiltreOrder());
	    registrationBean.addUrlPatterns("/detailsOrder/insert");
	    registrationBean.addUrlPatterns("/order/commandeEnCours");
	    registrationBean.addUrlPatterns("/order/validerCommande");
	    registrationBean.setOrder(2);
	        
	    return registrationBean;    
	}
	
}