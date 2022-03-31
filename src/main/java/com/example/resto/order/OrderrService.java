package com.example.resto.order;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.resto.detailsOrder.DetailsOrder;
import com.example.resto.detailsOrder.DetailsOrderRepository;
import com.example.resto.order.OrderrRepository;

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
    	
    	String seq = orderRepository.getIdOrder();
    	try {
    	 entityManager.createNativeQuery("INSERT INTO orderr VALUES (?,?,'S1',now())")
    	 .setParameter(1, seq)
    	 .setParameter(2, idTable)
    	 .executeUpdate();
    	}
    catch(Exception e) {e.printStackTrace();}
    	
    	return seq;
    }
	
}
