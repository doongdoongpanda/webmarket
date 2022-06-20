package com.doongdoongpanda2.domain.repository;

import java.util.List;

import com.doongdoongpanda.data.ProductRepositoryDbImpl;
import com.doongdoongpanda.data.ProductRepositoryImpl;
import com.doongdoongpanda2.domain.model.Product;

public interface ProductRepository {
	
	public static ProductRepository getInstance() {
		//이것만 바꿔주면 메모리냐 디비냐 정해줄수있다.
	return ProductRepositoryImpl.getInstance();//메모리
		//return new ProductRepositoryDbImpl(new MySqlProductDaoImpl());
		//DB
	}
	//인터페이스는 이걸로 통일
	public List<Product> getAllProducts();
	
	public Product getProductById(String id);
	
	public void addProduct(Product product);
	
}
