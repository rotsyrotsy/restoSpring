package com.example.resto.payement;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface PayementRepository extends JpaRepository<Payement,String>{
	@Query(nativeQuery = true, value ="select * from payement where date>?1 and date<?2 ")
	List<Payement> findBetween(Date date1, Date date2);
}
