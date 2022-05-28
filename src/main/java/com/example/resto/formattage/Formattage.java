package com.example.resto.formattage;

import java.text.DateFormat;

public class Formattage {
	public static String formatePrice(Object nb)
	{
		Double nombre = 0.0;
		if (nb instanceof String) {
			nombre = Double.valueOf((String)nb);
		}else {
			nombre = (Double) nb;
		}
		String val = nombre.toString();
		String entiere = val.split("\\.")[0];
		String apresVirgule = val.split("\\.")[1];
		StringBuilder sb = new StringBuilder(entiere);
		int count = 1;
		for(int i=entiere.length()-1;i>=0;i--)
		{
			if(count%3==0)
			{
				sb.insert(i, " ");				
			}
			count++;
		}
		return sb.toString()+"."+apresVirgule;
	}
	
	public static String formateDate(Object date)
	{
		DateFormat mediumDateFormat = DateFormat.getDateTimeInstance(
		        DateFormat.MEDIUM,
		        DateFormat.MEDIUM);
		return mediumDateFormat.format(date);
	
	}
}
