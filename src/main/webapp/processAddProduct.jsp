<%@page import="com.doongdoongpanda2.domain.model.Product"%>
<%@page import="com.doongdoongpanda.data.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 신규상품등록처리페이지: 이곳은 자바처리만 하는 곳 -->
<%
//post로 넘어온 것 받기
	request.setCharacterEncoding("UTF-8");
// POST로 넘어온 것
String productId = request.getParameter("productId");
String name = request.getParameter("name");
int unitPrice = Integer.valueOf(request.getParameter("unitPrice"));
String description = request.getParameter("description");
String manufacturer = request.getParameter("manufacturer");
String category = request.getParameter("category");
int unitsInStock = Integer.valueOf(request.getParameter("unitsInStock"));
String condition = request.getParameter("condition");

ProductRepository repository = ProductRepository.getInstance();

Product product = new Product(productId, name, unitPrice);
product.setDescription(description);
product.setManufacturer(manufacturer);
product.setCategory(category);
product.setUnitsInsStock(unitsInStock);
product.setCondition(condition);
repository.addProduct(product);
response.sendRedirect("products.jsp");
%>
