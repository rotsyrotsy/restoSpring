package com.example.resto.table;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class IdTable {
	@Id
	String id;
    String numero;

    public String getId() {
        return id;
    }

    public String getNumero() {
        return numero;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }
   

    
}
