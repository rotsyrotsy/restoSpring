/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.resto.controlle;

import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ratsi
 */
public class Controle {
    public static void controleDate(Date date1,Date date2) throws IllegalStateException
    {
        if(date1.compareTo(date2)>0)
        {
            throw new IllegalStateException("Date Début supérieur à Date Fin");
        }
    }
    public static void nombreNegatif(double nb) throws IllegalStateException {
    	if (nb<0) {
    		throw new IllegalStateException("Le chiffre que vous avez inséré est invalide,"
    				+ "veuillez insérer un chiffre positif");
    	}
    }
    public static boolean isAdmin(ServletRequest request) {
    	HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		if (session.getAttribute("sessionAdministrateur")!=null) {
			return true;
		}
		return false;
		
    }
}
