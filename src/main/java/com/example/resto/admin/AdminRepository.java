package com.example.resto.admin;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;



@Repository
public interface AdminRepository extends JpaRepository<Admin,String>{
	String QUERY_FIND_USER_FROM_DATBASE = "SELECT * from " +
		      "admin where " +
		      "login= ?1 and " +
		     "mdp=sha256(?2)";
	@Query(value = QUERY_FIND_USER_FROM_DATBASE, nativeQuery = true)
	Optional<Admin> findAdministrateurByEmailAndMdp(String email,String mdp);
	
}
