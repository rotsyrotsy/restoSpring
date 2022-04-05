package com.example.resto.stock;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.resto.marge.MargeService;
import com.example.resto.plat.PlatRepository;
import com.example.resto.plat.PlatService;

@Service
public class StockService {
	private final StockRepository repository;

	@Autowired
	private  PlatService platService;
	
    @Autowired
    public StockService(StockRepository repository) {
        this.repository = repository;
    }
    
    @PersistenceContext
    private EntityManager entityManager;
    
	public List<HashMap<String, Object>> getAllStockRestant(){
		List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();
		List<Object[]> liste = repository.getAllStockRestant();
        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] platRestant = (Object[]) liste.get(i);

            hm.put("id", platRestant[0]);
            hm.put("nomIngredient", platRestant[1]);
            hm.put("qte",platRestant[2]);
            hm.put("unite", platRestant[3]);
            listehm.add(hm);
        }
        return listehm;
	}
	 
	@Transactional
	public void insertStock(String idPlat)
	{
		List<HashMap<String, Object>> listAllIngredient = platService.getAllIngredient(idPlat);
		for(HashMap<String, Object> hm : listAllIngredient )
		{
			try {
				Double valeur = -(Double)hm.get("quantity");
		     	 entityManager.createNativeQuery("INSERT INTO stock VALUES (nextval('seqStock'),?,?,?)")
		     	 .setParameter(1, (String)hm.get("idIngredient"))
		     	 .setParameter(2, valeur)
		          .setParameter(3, (Date)hm.get("date"))
		          .executeUpdate(); 	
		     	}
		     catch(Exception e) {e.printStackTrace();}
		}
	}
}

