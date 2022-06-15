package com.doongdoongpanda2.domain.repository;

import java.util.List;

import com.doongdoongpanda.data.ProductRepositoryDbImpl;
import com.doongdoongpanda.data.dao.MySqlProductDaoImpl;
import com.doongdoongpanda2.domain.model.Product;

public interface ProductRepository {
	
	public static ProductRepository getInstance() {
		return new ProductRepositoryDbImpl(new MySqlProductDaoImpl());
	}
	public List<Product> getAllProducts();
	
	public Product getProductById(String id);
	
	public void addProduct(Product product);
	
}
