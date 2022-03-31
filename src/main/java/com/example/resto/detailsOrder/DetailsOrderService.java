package com.example.resto.detailsOrder;

import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.resto.plat.PlatService;


@Service
public class DetailsOrderService {
	private final DetailsOrderRepository repository;
	@Autowired
	private  PlatService platServ;
	
    @Autowired
    public DetailsOrderService(DetailsOrderRepository repository) {
        this.repository = repository;
    }
    
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
}
