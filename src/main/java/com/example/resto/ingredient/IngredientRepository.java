package com.example.resto.ingredient;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface IngredientRepository extends JpaRepository<Ingredient,String>{

	@Query(nativeQuery = true, value ="select * from qteIngredientParORder where  and daty>?1 and daty<=?2 ")
	List<Object[]> quantiteIngredientConsommer(Date date1, Date date2);
}
