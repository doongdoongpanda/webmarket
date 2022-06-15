package com.doongdoongpanda2.domain.repository;

import java.util.List;

import com.doongdoongpanda.data.ProductRepositoryImpl;
import com.doongdoongpanda2.domain.model.Product;

public interface ProductRepository {
	
	public static ProductRepository getInstance() {
		return ProductRepositoryImpl.getInstance();
	}
	public List<Product> getAllProducts();
	
	public Product getProductById(String id);
	
	public void addProduct(Product product);
	
}
