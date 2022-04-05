package com.example.resto.table;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TableService {
	private final TableRepository repository;

	   
    @Autowired
    public TableService(TableRepository repository) {
        this.repository = repository;
    }
    
    public List<IdTable> getAllTable(){
		return repository.findAll();
	}
    
    public List<HashMap<String, Object>> lastOrderByTable (){
 		List<Object[]> liste = repository.lastOrderByTable();
    	List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);

            hm.put("idOrder", s[0]);	//id
            hm.put("numero", s[1]);	//numero
            
            listehm.add(hm);
        }
 		return listehm;
 	}
    

    public List<HashMap<String, Object>> selectFromIdTable (){
 		List<Object[]> liste = repository.selectFromIdTable();
    	List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);

            hm.put("id", s[0]);	//id
            hm.put("numero", s[1]);	//numero
            
            listehm.add(hm);
        }
 		return listehm;
 	}
}
