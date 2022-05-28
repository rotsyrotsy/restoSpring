package com.example.resto.plat;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;



@Repository
public interface PlatRepository extends JpaRepository<Plat,String>{

	@Query(nativeQuery = true, value ="select * from platDetail ")
	List<Object[]> getAllPlatDetail();
	
	@Query(nativeQuery = true, value ="select * from platDetail  where categorie=?1  ")
	List<Object[]> getAllPlatDetailByCat(String categorie);

	@Query(nativeQuery = true, value ="select * from prixRevient")
	List<Object[]> getPrixAllPlats();
	

	@Query(nativeQuery = true, value ="select * from prixDeVente")
	List<Object[]> getPrixDeVente();

	@Query(nativeQuery = true, value ="select * from qteParPlatParIngredient where idPlat=:id")
	List<Object[]> getAllIngredient(@Param("id") String id);
	

	@Query(nativeQuery = true, value ="select * from ingredientPlat where idPlat=:id")
	List<Object[]> ingredientPlat(@Param("id") String id);
        
        
        @Query(nativeQuery = true, value ="select * from ingredientplat i join stockrestant s on i.idingredient = s.idingredient where idplat =:id and reste > quantity ")
	List<Object[]> getIngredientSuffisant(@Param("id") String id);
        
           @Query(nativeQuery = true, value ="select * from ingredientplat i where idplat =:id")
	List<Object[]> getIngredientOfPlat(@Param("id") String id);
}
