<%@page import="com.doongdoongpanda2.domain.model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="repository" class = "com.doongdoongpanda.data.ProductRepository" scope = "session"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>

<%
//ProductRepository repository = enw ProductRepository();
	List<Product> products = repository.getAllProducts();
out.println(products);
%>
</body>
</html>