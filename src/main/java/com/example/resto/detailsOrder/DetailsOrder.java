package com.example.resto.detailsOrder;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.example.resto.plat.Plat;

@Entity
@Table
public class DetailsOrder{
	@Id
	String id;
    String idOrder;
    String idPlat;
    Date daty;
    String idServeur;
    String etat;
    String lieulivraison;
    
	public String getLieulivraison() {
		return lieulivraison;
	}
	public void setLieulivraison(String lieulivraison) {
		this.lieulivraison = lieulivraison;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}
	public Date getDaty() {
		return daty;
	}
	public void setDaty(Date daty) {
		this.daty = daty;
	}
	public String getIdServeur() {
		return idServeur;
	}
	public void setIdServeur(String idServeur) {
		this.idServeur = idServeur;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIdOrder() {
		return idOrder;
	}
	public void setIdOrder(String idOrder) {
		this.idOrder = idOrder;
	}
	public String getIdPlat() {
		return idPlat;
	}
	public void setIdPlat(String idPlat) {
		this.idPlat = idPlat;
	}
}
