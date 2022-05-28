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
    public HashMap<String, Object> insertOrder(String idTable,String idServeur) {
    	
    	String seq = orderRepository.getIdOrder();
    	HashMap<String, Object> hm = new HashMap<String, Object>();
    	try {
    	 entityManager.createNativeQuery("INSERT INTO orderr VALUES (?,?,?,now())")
    	 .setParameter(1, seq)
    	 .setParameter(2, idTable)
    	 .setParameter(3, idServeur)
    	 .executeUpdate();
    	 
    	 List<Object[]> liste = orderRepository.getOrderTableById(seq);
    	 Object[] s = liste.get(0);

         hm.put("idOrder", s[0]);	
         hm.put("idServeur", s[1]);	
         hm.put("date", s[2]);	
         hm.put("idTable", s[3]);	
         hm.put("numero", s[4]);	
         
    	}
    catch(Exception e) {e.printStackTrace();}
    	
    	
    	return hm;
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
    
    public List<HashMap<String, Object>> getAdditionParTable(String idOrder) {
       	List<Object[]> liste = orderRepository.getAdditionParTable(idOrder);
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
    
    
    
    public HashMap<String, Object> lastOrderByTable (String idTable){
    	
    	List<Object[]> liste = orderRepository.lastOrderByTable(idTable);
            HashMap<String, Object> hm = new HashMap<String, Object>();
            if (liste.size()>0) {
            	Object[] s = liste.get(0);
                hm.put("idOrder", s[0]);	
                hm.put("idServeur", s[1]);	
                hm.put("date", s[2]);	
                hm.put("idTable", s[3]);	
                hm.put("numero", s[4]);	
            }
            
            
            
 		return hm;
 	}
    

    public List<HashMap<String, Object>> toHashCommandeParOrder(List<Object[]> liste,String idOrder) {
    
    	List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);

            hm.put("idPlat", s[0]);	
            hm.put("label", s[1]);	
            hm.put("montant", s[2]);	
            hm.put("image", s[3]);
            hm.put("iOrder", s[4]);
            hm.put("etat", s[5]);
            hm.put("idDetailsOrder", s[6]);
            listehm.add(hm);
        }
 		return listehm;
    }
    public List<HashMap<String, Object>> commandeEnCoursParOrder(String idOrder) {
       	List<Object[]> liste = orderRepository.commandeEnCoursParOrder(idOrder);
 		return this.toHashCommandeParOrder(liste, idOrder);
    }
    public List<HashMap<String, Object>> commandeValideParOrder(String idOrder) {
       	List<Object[]> liste = orderRepository.commandeValideParOrder(idOrder);
 		return this.toHashCommandeParOrder(liste, idOrder);
    }
    public List<HashMap<String, Object>> commandePretParOrder(String idOrder) {
       	List<Object[]> liste = orderRepository.commandePretParOrder(idOrder);
 		return this.toHashCommandeParOrder(liste, idOrder);
    }
	
}
