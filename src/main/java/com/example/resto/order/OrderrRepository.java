package com.example.resto.order;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface OrderrRepository extends JpaRepository<Orderr,String>{

	@Query(nativeQuery = true, value ="select nextval('seqOrderr')")
	String getIdOrder();
	
	@Query(nativeQuery = true, value ="select * from lastOrderByTable where idTable=?1")
	List<Object[]> lastOrderByTable(String idTable);
	

	@Query(nativeQuery = true, value ="select idServeur from orderr where id=?1")
	String getIdServeurFromOrder(String idOrder);

        @Query(nativeQuery = true, value ="select * from additionNonPaye")
        List<Object[]> getAdditionNonPaye();
        
            @Query(nativeQuery = true, value ="SELECT o.id as idorder, o.idserveur , o.daty, t.id as idtable , t.numero \r\n"
            		+ "          FROM orderr o\r\n"
            		+ "            JOIN idtable t ON o.idtable = t.id where o.id=?1")
            List<Object[]> getOrderTableById(String idOrder);

	
            

            @Query(nativeQuery = true, value ="select d.idplat ,p.label ,sum(cast(p.price as double precision)) as montant, p.image \r\n"
            		+ "            from detailsOrder d\r\n"
            		+ "            join plat p on d.idplat =p.id \r\n"
            		+ "            where d.idorder =?1 and d.etat='non valide'\r\n"
            		+ "            group by d.idplat , p.label,p.image")
            List<Object[]> commandeEnCoursParOrder(String idOrder);
}
