package com.example.resto.payement;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PayementService {
	private final PayementRepository repository;
	@Autowired
    public PayementService(PayementRepository repository) {
        this.repository = repository;
    }
	
	public List<Payement> findBetween(Date d1, Date d2){
		return repository.findBetween(d1, d2);
	}
	
	public double sumPayement(List<Payement> liste) {
		double sum = 0.0;
		for(Payement e: liste) {
			sum += e.getValeur();
		}
		return sum;
	}
}
