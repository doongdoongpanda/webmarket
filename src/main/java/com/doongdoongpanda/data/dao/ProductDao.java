package com.doongdoongpanda.data.dao;


import java.util.List;

import com.doongdoongpanda2.domain.model.Product;

// Data Access Object
// DB랑 연결할 놈
public interface ProductDao {
    // interface 안에서는 public 생략되어 있고 public 만 됨
    List<Product> getAll();

    void insert(Product product);

    void update(Product product);

    void delete(Product product);
}
