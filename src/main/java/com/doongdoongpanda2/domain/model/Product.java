package com.doongdoongpanda2.domain.model;

import java.util.Objects;

//1. 무지성 private 멤버 변수
//2. 필요하면 생성자 추가
//3. 무지성 getter/setter 읽기전용, 쓰기 전용
//4. 무지성 toString()
//5. 필요하면 equals/ hashCode재정의
public class Product {
	public static void main(String[] args) {
		Product product = new Product("33", "33", 11);
		System.out.println(product);
		
		Product product2 = new Product("33", "33", 11);
		System.out.println(product2);
		
		System.out.println(product == product2); //false
		System.out.println("name".equals("name"));// 정의 되어있으면 true
		System.out.println(product.hashCode() == product2.hashCode()); // 똑같이 생겼으면 같은 놈으로 보자!!! 하니깐 해시코드도 같아짐
		System.out.println(product == product2); //하지만 다른건 다름 false그래서 equals로 비교하는 것
	}
	private String id;
	private String name;
	private int unitPrice;
	private String description;
	private String manufacturer;
	private String category;
	private long unitsInsStock;
	private String condition;
	

	public String getId() {
		return id;
	}
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		return Objects.equals(id, other.id);
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getUnitsInsStock() {
		return unitsInsStock;
	}
	public void setUnitsInsStock(long unitsInsStock) {
		this.unitsInsStock = unitsInsStock;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	//tostirng 하면 string으로 재정의할 경우 내가 도와줄께
	@Override
	public String toString() {
		return "Product [name=" + name + ", unitPrice=" + unitPrice + ", description=" + description + ", manufacturer="
				+ manufacturer + ", category=" + category + ", unitsInsStock=" + unitsInsStock + ", condition="
				+ condition + ", id=" + id + "]";
	}
	public Product( String id, String name, int unitPrice) {
		this.id = id;
		this.name = name;
		this.unitPrice = unitPrice;
		
	}
	
	
	
	
}
