package com.example.resto.ingredient;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.resto.formattage.Formattage;
import com.example.resto.plat.Plat;


@Service
public class IngredientService {
	private final IngredientRepository repository;

    @Autowired
    public IngredientService(IngredientRepository repository) {
        this.repository = repository;
    }
    public List<Ingredient> getIngredients() {
        
        return repository.findAll();
    }
 
    public List<HashMap<String, Object>> getIngredientConsomer (Date date1, Date date2){
    	
    	List<Object[]> liste = repository.quantiteIngredientConsommer(date1, date2);
    	List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);
            
            hm.put("label", s[0]);	
            hm.put("quantite", s[1]);	
            hm.put("unite", s[2]);	
            hm.put("pu", Formattage.formatePrice(s[3]));		
            hm.put("prixTotal", s[4]);			
            listehm.add(hm);
        }
 		return listehm;
 	}
}
