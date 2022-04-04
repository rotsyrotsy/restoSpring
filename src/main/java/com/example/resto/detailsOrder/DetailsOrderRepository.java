package com.example.resto.detailsOrder;

import com.example.resto.serveur.Serveur;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface DetailsOrderRepository extends JpaRepository<DetailsOrder,String>{
	@Query(nativeQuery = true, value ="select * from detailsOrder where idServeur=?1 and daty>?2 and daty<=?3 order by idorder")
	List<Object[]> dateOrderDetails(String idServeur,Date date1, Date date2);
	

	@Query(nativeQuery = true, value ="select * from prixOrderServeur where idServeur=?1 and date>?2 and date<=?3 order by idOrder")
	List<Object[]> prixOrderServeur(String idServeur,Date date1, Date date2);
	
	
	@Query(nativeQuery = true, value ="select * from prixPlatOrder where idServeur=?1 ")
	List<Object[]> prixPlatOrder(String idServeur,Date date1, Date date2);
	

	@Query(nativeQuery = true, value ="select * from detailsOrder  where idOrder=?1 ")
	List<Object[]> getDetailsOrderByIdOrder(String idOrder);
	

	@Query(nativeQuery = true, value ="select * from prixPlatOrder where idOrder=?1 ")
	List<Object[]> getprixPlatOrderByIdOrder(String idOrder);
	

	@Query(nativeQuery = true, value ="select id from lastOrder")
	String getCurrOrder();

        @Query(nativeQuery = true, value ="select * from platValider where etat = 'valide'")
        List<Object[]> getDetailsOrderValide();
}
