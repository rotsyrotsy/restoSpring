package com.example.resto.table;

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
    
    public List<Tables> getAllTable(){
		return repository.findAll();
	}
}
