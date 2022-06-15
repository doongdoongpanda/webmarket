package com.doongdoongpanda.data;

import java.util.List;
import com.doongdoongpanda.data.dao.ProductDao;
import com.doongdoongpanda2.domain.model.Product;
import com.doongdoongpanda2.domain.repository.ProductRepository;

public class ProductRepositoryDbImpl implements ProductRepository {
    private ProductDao dao;
    
    public ProductRepositoryDbImpl(ProductDao dao) {
       this.dao = dao;
    }

    @Override
    public List<Product> getAllProducts() {
        return dao.getAll();
    }

    @Override
    public Product getProductById(String id) {
    	// List -> Stream (데이터의 흐름)
    			return getAllProducts().stream().filter((product) -> product.getId().equals(id)) // 조건봄
    					.findFirst() // 첫번째꺼 취하는데
    					.get(); // 그걸 얻어
    }

    @Override
    public void addProduct(Product product) {
       dao.insert(product);
    }
    
}