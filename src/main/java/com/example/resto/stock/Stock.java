package com.example.resto.stock;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Stock {
	@Id
	String id;
	String idIngredient;
	Double valeur;
	Date date;
	
	public String getIdIngredient() {
		return idIngredient;
	}
	public void setIdIngredient(String idIngredient) {
		this.idIngredient = idIngredient;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Double getValeur() {
		return valeur;
	}
	public void setValeur(Double valeur) {
		this.valeur = valeur;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
