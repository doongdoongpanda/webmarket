package com.doongdoongpanda.data;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Stack;

import com.doongdoongpanda2.domain.model.Product;

public class ProductRepository {
	public static void main(String[] args) {
		
	
	//삽입 삭제가 빈번할 때 항 상 동일 성능, 근데 ArrayList보다 검색이 느려
	//메모리 더 많이 먹어
	LinkedList<Product> products = new LinkedList<>();
	//크기가 커질 수록 삽입, 삭제가 느려짐, 근데 내부적으로는 배열이라 성능 자체가 일단 빠름.갯수가 얼마 없을 때 사용
	ArrayList<Product> products2 = new ArrayList<>();
	
	
	Product[] products3 = new Product[3];
	sort(Arrays.asList(products3));
	sort(products2);
	Stack stack = (Stack) sort(products); //
	}
	
	//매소드 설정할때 list 고려해야한다. 배열받지 않고 list 받는 편이다.배열을 리스트로 변환해서 쓰거나
	public static List<Product> sort(List<Product> products){
		return new ArrayList<>();
	}
}
