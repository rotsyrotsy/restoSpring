package com.example.resto.admin;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminService {
	 private final AdminRepository repository;

	   
	    @Autowired
	    public AdminService(AdminRepository admRepository) {
	        this.repository = admRepository;
	    }


		
    public Optional<Admin> find(Admin adm) { 
    	Optional<Admin> ad = repository.findAdministrateurByEmailAndMdp(adm.getLogin(),adm.getMdp());
    	if (!ad.isPresent()) {
			throw new IllegalStateException("Veuillez verifier votre mot de passe et votre email");
		}
        return ad;
    }
    
}
