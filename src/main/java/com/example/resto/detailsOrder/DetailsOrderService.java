package com.example.resto.detailsOrder;

import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.resto.formattage.Formattage;
import com.example.resto.order.OrderrRepository;
import com.example.resto.plat.PlatService;


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
    
 	public List<HashMap<String, Object>> getPrixOrderServeur (String idServeur, Date date1, Date date2){
 		List<Object[]> liste = repository.prixOrderServeur( idServeur,  date1,  date2);
    	List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);

            hm.put("valeurOrder", Formattage.formatePrice(Formattage.formatDecimale((Double)s[0])));	//sumPrix
            hm.put("idOrder", s[1]);	//idOrder
            hm.put("idServeur", s[2]);	//idServeur
            hm.put("date", Formattage.formateDate(s[3]));		//date
            hm.put("pourcentage", s[4]);	//pourboire
            listehm.add(hm);
        }
 		return listehm;
 	}
 	

	 @Transactional
	   public void validerCommande(String idOrder) {
		 System.out.println("IDORDEER: "+idOrder);
	        try {
	        	 entityManager.createNativeQuery("UPDATE detailsOrder SET etat='valide' where idOrder=? and etat is not null")
	        	 .setParameter(1, idOrder)
	             .executeUpdate(); 	
	        	}
	        catch(Exception e) {e.printStackTrace();}
	        
	 }
	        	
	 
    
 	 @Transactional
     public void insertDetailsOrder(String idPlat, String idOrder) {
 		System.out.println("IDPLAT: "+idPlat+", IDORDER: "+idOrder);
                
                if(platServ.platIsInStock(idPlat)==false)
                {
                    throw new IllegalStateException("Stock insuffisant. Impossible de commander ce plat");
                }
                
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
            hm.put("daty", Formattage.formateDate(s[3]));	
            hm.put("idServeur", s[4]);
            hm.put("etat", s[5]);
            hm.put("label", s[6]);		
            
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
            hm.put("daty", Formattage.formateDate(s[3]));	
            hm.put("idServeur", s[4]);
            hm.put("etat", s[5]);
            hm.put("label", s[6]);	
            
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
            hm.put("daty", Formattage.formateDate(s[3]));	
            hm.put("idServeur", s[4]);
            hm.put("etat", s[5]);
            hm.put("label", s[6]);	
            
            listehm.add(hm);
        }
 		return listehm;
 	
    }
    
    
    @Transactional
    public void changeToEnPreparation(String idDetailOrder) {
    	System.out.println("IDDETTTTT: "+idDetailOrder);
         try {
     	 entityManager.createNativeQuery("UPDATE detailsOrder SET etat = 'en preparation' WHERE id = ?  ")
     	 .setParameter(1, idDetailOrder)
          .executeUpdate(); 	
     	}
     catch(Exception e) {e.printStackTrace();}
    }

    @Transactional
    public void changeToPret(String idDetailOrder) {
    	
           try {
     	 entityManager.createNativeQuery("UPDATE detailsOrder SET etat = 'pret' WHERE id = ? ")
     	 .setParameter(1, idDetailOrder)
          .executeUpdate(); 	
     	}
     catch(Exception e) {e.printStackTrace();}
    }
    
    public String getIdPlat(String idDetailOrder) {
    	return repository.getIdPlat(idDetailOrder);
    	
    }
    @Transactional
	public void annulerCommande(String idDetailOrder) {
    	try {
        	 entityManager.createNativeQuery("UPDATE detailsOrder SET etat = null WHERE id = ? ")
        	 .setParameter(1, idDetailOrder)
             .executeUpdate(); 	
        	}
        catch(Exception e) {e.printStackTrace();}
		
	}
}
