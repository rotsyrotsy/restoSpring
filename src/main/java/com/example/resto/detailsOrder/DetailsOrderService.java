package com.example.resto.detailsOrder;

import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.resto.order.OrderrRepository;
import com.example.resto.order.OrderrService;
import com.example.resto.plat.PlatService;
import com.example.resto.serveur.Serveur;
import com.example.resto.stock.StockService;


@Service
public class DetailsOrderService {
	
	private final DetailsOrderRepository repository;
	@Autowired
	private  PlatService platServ;
	
	
	
	@Autowired
	private  OrderrRepository ordServ;
	
    @Autowired
    public DetailsOrderService(DetailsOrderRepository repository) {
        this.repository = repository;
    }
    @PersistenceContext
    private EntityManager entityManager;
    
    public List<HashMap<String, Object>> getDateOrderDetails (String idServeur, Date date, Date date2){
    	List<Object[]> liste = repository.dateOrderDetails( idServeur,  date,  date2);
    	List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);

            hm.put("id", s[0]);
            hm.put("idOrder", s[1]);
            hm.put("idPlat", s[2]);
            hm.put("date", s[3]);
            hm.put("idServeur", s[4]);
            listehm.add(hm);
        }
    	List<HashMap<String, Object>> plats = platServ.getPrixAllPlats();
    	
    	for(int i=0; i<plats.size(); i++) {
    		HashMap<String, Object> temp = plats.get(i);
    		String str = (String)temp.get("idPlat");
 			
    		for(int j=0; j<listehm.size(); j++) {
    			HashMap<String, Object> temp2 = listehm.get(j);
    			String str2 = (String)temp2.get("idPlat");
    			if (str.compareTo(str2)==0) {
    				temp2.put("prixVente", temp.get("prixVente"));
    			}
    		}
    	}
    	return listehm;
    }
 
 	public List<HashMap<String, Object>> groupByIdOrder (String idServeur, Date date1, Date date2){
 		List<HashMap<String, Object>> orders = this.getDateOrderDetails(idServeur, date1  ,date2);
 		
 		List<HashMap<String, Object>> val = new ArrayList<HashMap<String, Object>>();
 		
 		HashMap<String,Object> first = orders.get(0);
 		String strId = (String)first.get("idOrder");
 		Double sum = (Double)first.get("prixVente");
			
 		for(int i=1; i<orders.size(); i++) {

 			HashMap<String,Object> temp = orders.get(i);
 			
 			String idOrder = (String)temp.get("idOrder");

				
 			if (strId.compareTo(idOrder)==0) {
 				sum += (Double)temp.get("prixVente");

 			}else {
 				strId = idOrder;
 				first.put("valeurOrder", sum);
 				first.put("pourcentage", sum*0.02);
 				val.add(first);
 				sum = (Double)temp.get("prixVente");
 				first = orders.get(i);
 			}
 		}
 		
			first.put("valeurOrder", sum);
			first.put("pourcentage", sum*0.02);
			val.add(first);
			
 		return val;
 	}
 	
 	public List<HashMap<String, Object>> getPrixOrderServeur (String idServeur, Date date1, Date date2){
 		List<Object[]> liste = repository.prixOrderServeur( idServeur,  date1,  date2);
    	List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);

            hm.put("valeurOrder", s[0]);	//sumPrix
            hm.put("idOrder", s[1]);	//idOrder
            hm.put("idServeur", s[2]);	//idServeur
            hm.put("date", s[3]);		//date
            hm.put("pourcentage", s[4]);	//pourboire
            listehm.add(hm);
        }
 		return listehm;
 	}
 	
 	public List<HashMap<String, Object>> getprixPlatOrderByIdOrder (String idOrder){
 		List<Object[]> liste = repository.getprixPlatOrderByIdOrder( idOrder);
    	List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);

            hm.put("id", s[0]);	//sumPrix
            hm.put("idOrder", s[1]);	//idOrder
            hm.put("idPlat", s[2]);	//idServeur
            hm.put("plat", s[3]);		
            hm.put("idServeur", s[4]);	
            hm.put("date", s[5]);
            hm.put("prixVente", s[6]);
            listehm.add(hm);
        }
 		return listehm;
 	}
 	

	 @Transactional
	   public void validerCommande(String idOrder) {
		 System.out.println("IDORDEER: "+idOrder);
	        try {
	        	 entityManager.createNativeQuery("UPDATE detailsOrder SET etat='valide' where idOrder=?")
	        	 .setParameter(1, idOrder)
	             .executeUpdate(); 	
	        	}
	        catch(Exception e) {e.printStackTrace();}
	        
	 
	 }
	        	
	 
    
 	 @Transactional
     public void insertDetailsOrder(String idPlat, String idOrder) {
 		String idServeur = ordServ.getIdServeurFromOrder(idOrder);
     try {
     	 entityManager.createNativeQuery("INSERT INTO detailsOrder VALUES (nextval('seqDetailsOrder'),?,?,now(),?,'non valide')")
     	 .setParameter(1, idOrder)
     	 .setParameter(2, idPlat)
          .setParameter(3, idServeur)
          .executeUpdate(); 	
     	}
     catch(Exception e) {e.printStackTrace();}
     }

    public List<HashMap<String, Object>> getDetailsOrderValide() {
        
        	List<Object[]> liste = repository.getDetailsOrderValide();
    	List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);
            hm.put("id", s[0]);
            hm.put("idOrder", s[1]);	
            hm.put("idPlat", s[2]);	
            hm.put("daty", s[3]);	
            hm.put("idServeur", s[4]);
            hm.put("etat", s[5]);
            hm.put("lieuLivraison", s[6]);
            hm.put("label", s[7]);		
            
            listehm.add(hm);
        }
 		return listehm;
 	}
    public List<HashMap<String, Object>> getDetailsOrderPrep() {
        	List<Object[]> liste = repository.getDetailsOrderEnPrep();
    	List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);

            hm.put("id", s[0]);
            hm.put("idOrder", s[1]);	
            hm.put("idPlat", s[2]);	
            hm.put("daty", s[3]);	
            hm.put("idServeur", s[4]);
            hm.put("etat", s[5]);
            hm.put("lieuLivraison", s[6]);
            hm.put("label", s[7]);	
            
            listehm.add(hm);
        }
 		return listehm;
 	
                
    }
    
        public List<HashMap<String, Object>> getDetailsOrderPret() {
        	List<Object[]> liste = repository.getDetailsOrderPret();
    	List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);

            hm.put("id", s[0]);
            hm.put("idOrder", s[1]);	
            hm.put("idPlat", s[2]);	
            hm.put("daty", s[3]);	
            hm.put("idServeur", s[4]);
            hm.put("etat", s[5]);
            hm.put("lieuLivraison", s[6]);
            hm.put("label", s[7]);	
            
            listehm.add(hm);
        }
 		return listehm;
 	
    }
    
    
    @Transactional
    public void changeToEnPreparation(String idDetailOrder) {
    	System.out.println("IDDETTTTT: "+idDetailOrder);
         try {
     	 entityManager.createNativeQuery("UPDATE detailsOrder SET etat = 'en preparation' WHERE id = ?")
     	 .setParameter(1, idDetailOrder)
          .executeUpdate(); 	
     	}
     catch(Exception e) {e.printStackTrace();}
    }

    @Transactional
    public void changeToPret(String idDetailOrder) {
    	
           try {
     	 entityManager.createNativeQuery("UPDATE detailsOrder SET etat = 'pret' WHERE id = ?")
     	 .setParameter(1, idDetailOrder)
          .executeUpdate(); 	
     	}
     catch(Exception e) {e.printStackTrace();}
    }
    
    public String getIdPlat(String idDetailOrder) {
    	return repository.getIdPlat(idDetailOrder);
    	
    }

   
}
