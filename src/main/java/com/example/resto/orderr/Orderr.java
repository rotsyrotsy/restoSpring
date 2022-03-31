package com.example.resto.orderr;


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
	String daty;
	
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
	public String getDaty() {
		return daty;
	}
	public void setDaty(String daty) {
		this.daty = daty;
	}
}
