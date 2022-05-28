package com.example.resto.serveur;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServeurRepository extends JpaRepository<Serveur,String>{

}
