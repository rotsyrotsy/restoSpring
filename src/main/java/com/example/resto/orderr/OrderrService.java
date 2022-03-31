package com.example.resto.orderr;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.resto.plat.PlatRepository;

@Service
public class OrderrService {

    @PersistenceContext
    private EntityManager entityManager;
    private final OrderrRepository orderRepository;
    
    @Autowired
    public OrderrService(OrderrRepository repository) {
        this.orderRepository = repository;
    }

    @Transactional
    public String insertOrder(String idTable) {
    	try {
    	 entityManager.createNativeQuery("INSERT INTO orderr VALUES (nextval('seqOrderr'),?,'S1',now())")
    	 .setParameter(1, idTable)
         .executeUpdate();
    	}
    catch(Exception e) {e.printStackTrace();}
    	return seq;
    }
}
