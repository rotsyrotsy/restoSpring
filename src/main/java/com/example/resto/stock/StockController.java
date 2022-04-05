package com.example.resto.stock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/stock")
public class StockController {
	@Autowired
	private  StockService service;
	public StockController(StockService service) {
	        this.service = service;
	    }
}
