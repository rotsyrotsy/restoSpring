package com.example.resto.ingredient;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class IngredientService {
	private final IngredientRepository repository;

    @Autowired
    public IngredientService(IngredientRepository repository) {
        this.repository = repository;
    }
    
    public List<HashMap<String, Object>> getIngredientConsomer (Date date1, Date date2){
 		List<Object[]> liste = repository.quantiteIngredientConsommer(date1, date2);
    	List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);

            hm.put("valeurOrder", s[0]);	//sumPrix
            hm.put("label", s[1]);	//idOrder
            hm.put("quantite", s[2]);	//idServeur
            hm.put("unite", s[3]);		//date
            listehm.add(hm);
        }
 		return listehm;
 	}
}
