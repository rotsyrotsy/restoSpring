package com.example.resto.stock;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface StockRepository extends JpaRepository<Stock,String>{

	@Query(nativeQuery = true, value ="select * from stockRestant ")
	List<Object[]> getAllStockRestant();
	
}
