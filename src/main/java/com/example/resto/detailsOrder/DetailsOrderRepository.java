package com.example.resto.detailsOrder;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface DetailsOrderRepository extends JpaRepository<DetailsOrder,String>{
	@Query(nativeQuery = true, value ="select * from detailsOrder where idServeur=?1 and daty>?2 and daty<=?3 order by idorder")
	List<Object[]> dateOrderDetails(String idServeur,Date date1, Date date2);
}
