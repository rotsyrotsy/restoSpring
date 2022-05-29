package com.example.resto.payement;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.resto.formattage.Formattage;
import com.example.resto.order.OrderrService;


@Service
public class PayementService {
	@PersistenceContext
    private EntityManager entityManager;
	
	@Autowired
	private  OrderrService oderService;
	
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

	@Transactional
	public void insertWithQuery(Payement paie) {
        System.out.println(paie.getValeur());
		entityManager.createNativeQuery("INSERT INTO payement (id, idorder,valeur,date,type) VALUES ('P' || nextval('seqpayement'),?,?,CURRENT_DATE, ?)")
		      .setParameter(1, paie.getIdOrder())
		      .setParameter(2, paie.getValeur())
		      .setParameter(3, paie.getType())
		      .executeUpdate();
	}
}
