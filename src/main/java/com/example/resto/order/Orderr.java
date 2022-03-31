package com.example.resto.order;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Orderr {
	@Id
	String id;
    String idTable;
    String idServeur;
    Date daty;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIdTable() {
		return idTable;
	}
	public void setIdTable(String idTable) {
		this.idTable = idTable;
	}
	public String getIdServeur() {
		return idServeur;
	}
	public void setIdServeur(String idServeur) {
		this.idServeur = idServeur;
	}
	public Date getDaty() {
		return daty;
	}
	public void setDaty(Date daty) {
		this.daty = daty;
	}
    
}
