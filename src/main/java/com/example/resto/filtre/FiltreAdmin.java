package com.example.resto.filtre;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.example.resto.controlle.Controle;

@Component
@Order(1)
public class FiltreAdmin implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        if (!Controle.isAdmin(request)) {
        	String baseURL = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort();
        	res.sendRedirect(baseURL+"/admin/forbidden");
		}
        
        	chain.doFilter(request, response);
        
	}
	
	@Bean(name="loggingFilter1")
	public FilterRegistrationBean<Filter> loggingFilter(){
	    FilterRegistrationBean<Filter> registrationBean 
	      = new FilterRegistrationBean<>();
	        
	    registrationBean.setFilter(new FiltreAdmin());
	    registrationBean.addUrlPatterns("/detailsOrder/choixServeurPourboire");
	    registrationBean.addUrlPatterns("/detailsOrder/choixServeurBase");
	    registrationBean.addUrlPatterns("/ingredients/resultDate");
	    registrationBean.addUrlPatterns("/ingredients/choixDate");
	    registrationBean.addUrlPatterns("/order/boAdditionNonPaye");
	    registrationBean.addUrlPatterns("/payement/*");
	    registrationBean.addUrlPatterns("/plats/prix-plat-base");
	    registrationBean.addUrlPatterns("/plats/prix-plat");
	    registrationBean.addUrlPatterns("/stock/*");
	    registrationBean.setOrder(1);
	        
	    return registrationBean;    
	}
	
}