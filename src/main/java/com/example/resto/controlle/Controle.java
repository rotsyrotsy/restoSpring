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
    public static void nombreNegatif(double nb) throws IllegalStateException {
    	if (nb<0) {
    		throw new IllegalStateException("Le chiffre que vous avez inséré est invalide,"
    				+ "veuillez insérer un chiffre positif");
    	}
    }
}
