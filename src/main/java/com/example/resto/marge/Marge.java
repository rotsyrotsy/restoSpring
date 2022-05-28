package com.example.resto.marge;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Marge {
	@Id
	String id;
	Double maximum;
	Double minimum;
	Double pourcentage;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Double getMaximum() {
		return maximum;
	}
	public void setMaximum(Double maximum) {
		this.maximum = maximum;
	}
	public Double getMinimum() {
		return minimum;
	}
	public void setMinimum(Double minimum) {
		this.minimum = minimum;
	}
	public Double getPourcentage() {
		return pourcentage;
	}
	public void setPourcentage(Double pourcentage) {
		this.pourcentage = pourcentage;
	}
}
