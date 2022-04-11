package com.example.resto.order;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface OrderrRepository extends JpaRepository<Orderr,String>{

	@Query(nativeQuery = true, value ="select nextval('seqOrderr')")
	String getIdOrder();
	

	@Query(nativeQuery = true, value ="select idServeur from orderr where id=?1")
	String getIdServeurFromOrder(String idOrder);

        @Query(nativeQuery = true, value ="select * from additionNonPaye")
        List<Object[]> getAdditionNonPaye();
	

}
