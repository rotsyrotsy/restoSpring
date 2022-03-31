package com.example.resto.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.resto.detailsOrder.DetailsOrder;
import com.example.resto.detailsOrder.DetailsOrderRepository;

@Service
public class OrderrService {
	private final OrderrRepository repository;
	@Autowired
    public OrderrService(OrderrRepository repository) {
        this.repository = repository;
    }
	
}
