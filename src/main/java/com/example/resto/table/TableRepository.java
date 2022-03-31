package com.example.resto.table;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface TableRepository extends JpaRepository<IdTable,String>{
	@Query(nativeQuery = true, value ="select * from lastOrderByTable")
	List<Object[]> lastOrderByTable();
	
}
