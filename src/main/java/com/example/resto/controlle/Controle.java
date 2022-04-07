/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.resto.controlle;

/**
 *
 * @author ratsi
 */
public class Controle {
    public void nombreNegatif(double nb) throws IllegalStateException {
    	if (nb<0) {
    		throw new IllegalStateException("Le nombre que vous avez inséré est invalide,"
    				+ "veuillez insérere un nombre positif");
    	}
    }
}
