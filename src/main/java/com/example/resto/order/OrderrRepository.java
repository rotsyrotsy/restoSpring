package com.example.resto.order;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface OrderrRepository extends JpaRepository<Orderr,String>{

}
