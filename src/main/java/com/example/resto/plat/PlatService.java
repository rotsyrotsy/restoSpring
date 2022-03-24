package com.example.resto.plat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.resto.marge.Marge;
import com.example.resto.marge.MargeRepository;
import com.example.resto.marge.MargeService;


@Service
public class PlatService {
	private final PlatRepository repository;

	@Autowired
	private  MargeService margeServ;

	   
    @Autowired
    public PlatService(PlatRepository repository) {
        this.repository = repository;
    }
    
    public List<HashMap<String, Object>> hashMapPlatDetail(List<Object[]> liste) {
        List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);
            hm.put("id", s[0]);
            hm.put("label", s[1]);
            hm.put("price", s[2]);
            hm.put("categorie", s[3]);
            listehm.add(hm);
        }
        return listehm;
    }
    public List<HashMap<String, Object>> getAllPlats() {
        List<Object[]> liste = repository.getAllPlatDetail();
        List<HashMap<String, Object>> listehm = this.hashMapPlatDetail(liste);
        return listehm;
    }
	public List<HashMap<String, Object>> getPlatByCategorie(String cat) {
		List<Object[]> liste = repository.getAllPlatDetailByCat(cat);
        List<HashMap<String, Object>> listehm = this.hashMapPlatDetail(liste);
        return listehm;
	}
	
	public List<HashMap<String, Object>> getPrixAllPlats(){
		List<HashMap<String, Object>> listehm = new ArrayList<HashMap<String, Object>>();
		List<Object[]> liste = repository.getPrixAllPlats();
		
		List<Marge> marges = margeServ.getAllMarges();
		

        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> hm = new HashMap<String, Object>();
            Object[] s = (Object[]) liste.get(i);

    		Double pourc = this.getPourcentagePrixVente(marges, (Double)s[3]);
            Double pr = (Double)s[3];
            hm.put("idPlat", s[0]);
            hm.put("label", s[1]);
            hm.put("prixVente", pr+(pr*pourc/100));
            hm.put("pourcentage", pourc);
            hm.put("prixDeRevient", pr);
            listehm.add(hm);
        }
        return listehm;
	}
	
	public Double getPourcentagePrixVente(List<Marge> marges, Double prixRevient) {
		for(int i=0; i<marges.size(); i++) {
			Marge temp = (Marge)marges.get(i);
			if (temp.getMaximum()>prixRevient && temp.getMinimum()<=prixRevient) {
				return temp.getPourcentage();
			}
		}
		return 0.0;
	}
}
