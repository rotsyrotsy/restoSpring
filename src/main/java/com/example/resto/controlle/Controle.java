/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.resto.controlle;

import java.util.Date;

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
}
