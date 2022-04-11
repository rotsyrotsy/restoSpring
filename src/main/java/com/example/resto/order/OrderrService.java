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
import java.util.ArrayList;
import java.util.HashMap;

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
    public String insertOrder(String idTable,String idServeur) {
    	
    	String seq = orderRepository.getIdOrder();
    	try {
    	 entityManager.createNativeQuery("INSERT INTO orderr VALUES (?,?,?,now())")
    	 .setParameter(1, seq)
    	 .setParameter(2, idTable)
    	 .setParameter(3, idServeur)
    	 .executeUpdate();
    	}
    catch(Exception e) {e.printStackTrace();}
    	
    	return seq;
    }

    public List<HashMap<String, Object>> getAdditionNonPaye() {
       	List<Object[]> liste = orderRepository.getAdditionNonPaye();
    	List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);

            hm.put("date", s[0]);	
            hm.put("total", s[1]);	
            hm.put("dejapayer", s[2]);	
            hm.put("restant", s[3]);
            hm.put("numero", s[4]);	
            listehm.add(hm);
        }
 		return listehm;
 	
    }
	
}
