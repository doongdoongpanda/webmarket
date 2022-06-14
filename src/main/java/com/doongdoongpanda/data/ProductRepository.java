package com.doongdoongpanda.data;

import java.util.ArrayList;
import java.util.List;
import com.doongdoongpanda2.domain.model.Product;

public class ProductRepository {

	ArrayList<Product> products = new ArrayList<>();
	// 매번 새롭게 불러내지 말고 한번만들어서 계속 쓰자
	private static ProductRepository instance = new ProductRepository();

	// 싱글턴 패턴
	// 1. static 인스턴스 준비
	// 2. static 메서드로 인스턴스 리턴(getInstance()이름을 주로 씀)
	// 3. 생성자 막기(private)
	public static ProductRepository getInstance() {
		return instance;
	}

	// private으로 하면 new를 못함
	//자바빈즈 기본 생성자 있어야하니깐 아 까먹었다.
	public ProductRepository() {
		Product phone = new Product("P1234", "iPhone 6s", 800000);

		phone.setDescription("4.7-inch, 1334x750 Retina HD display");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInsStock(1000);
		phone.setCondition("New");

		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("!4.7-inch, 1334x750 Retina HD display");
		notebook.setCategory("!Smart Phone");
		notebook.setManufacturer("!Apple");
		notebook.setUnitsInsStock(1000);
		notebook.setCondition("Refubished");

		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
		tablet.setDescription("?4.7-inch, 1334x750 Retina HD display");
		tablet.setCategory("?Smart Phone");
		tablet.setManufacturer("?Apple");
		tablet.setUnitsInsStock(1000);
		tablet.setCondition("Old");

		products.add(phone);
		products.add(notebook);
		products.add(tablet);
	}

	public List<Product> getAllProducts() {
		return products;
	}

	public Product getProductById(String id) {
		// 173p 참고
		// List -> Stream (데이터의 흐름)
		return products.stream().filter((product) -> product.getId().equals(id)) // 조건봄
				.findFirst() // 첫번째꺼 취하는데
				.get(); // 그걸 얻어
	}

	public void addProduct(Product product) {
		products.add(product);
	}

}
