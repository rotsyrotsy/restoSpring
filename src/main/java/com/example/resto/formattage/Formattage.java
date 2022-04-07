package com.example.resto.formattage;

public class Formattage {
	public static String formatePrice(double nb)
	{
		Double nombre = nb;
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
}
