package com.example.resto.ingredient;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Ingredient {
	@Id
	String id;
    String label;
	String labelUnity;
    Double price;

	public String getLabelUnity() {
		return labelUnity;
	}

	public void setLabelUnity(String labelUnity) {
		this.labelUnity = labelUnity;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
