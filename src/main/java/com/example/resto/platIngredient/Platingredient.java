package com.example.resto.platIngredient;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Platingredient {
	@Id
	String id;
    String idplat;
    String idingredient;
    Double quantity;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIdplat() {
		return idplat;
	}
	public void setIdplat(String idplat) {
		this.idplat = idplat;
	}
	public String getIdingredient() {
		return idingredient;
	}
	public void setIdingredient(String idingredient) {
		this.idingredient = idingredient;
	}
	public Double getQuantity() {
		return quantity;
	}
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
    
}
