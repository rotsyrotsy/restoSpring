package com.example.resto.ingredient;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface IngredientRepository extends JpaRepository<Ingredient,String>{

	@Query(nativeQuery = true, value ="\r\n"
			+ "select tab.*, i.price as pu, quantity*i.price as prixTotal from(\r\n"
			+ "    select nomIngredient, sum(quantity) as quantity,unite\r\n"
			+ "    from qteIngredientParOrder where daty>?1\r\n"
			+ "    and daty<?2 group by nomIngredient,unite\r\n"
			+ ") as tab join ingredient i on i.label = tab.nomIngredient")
	List<Object[]> quantiteIngredientConsommer(Date date1, Date date2);
}
