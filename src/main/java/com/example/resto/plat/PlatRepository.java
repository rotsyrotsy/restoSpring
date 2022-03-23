package com.example.resto.plat;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface PlatRepository extends JpaRepository<Plat,String>{

	@Query(nativeQuery = true, value ="select * from platDetail ")
	List<Object[]> getAllPlatDetail();
	
	@Query(nativeQuery = true, value ="select * from platDetail  where categorie=?1  ")
	List<Object[]> getAllPlatDetailByCat(String categorie);
  
}
