<%@page import="com.doongdoongpanda2.domain.model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="repository" class = "com.doongdoongpanda.data.ProductRepository" scope = "session"></jsp:useBean>
<html>
  <head>
    <meta charset="UTF-8">
    <title>상품 목록</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet">
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    
    <body>
      <jsp:include page="menu.jsp"></jsp:include>
    
      <div class="p-5 bg-primary text-white">
        <div class="container">
          <h1 class="display-3">상품 목록</h1>
        </div>
      </div>
    
      <div class="container">
        <div class="row" align="center">
                <%
                List<Product> products = repository.getAllProducts();
                for (int i = 0; i < products.size(); i++) {
                    Product product = products.get(i);
                %>
            <div class="col-md-4">
              <h3><%= product.getName() %></h3>
              <p><%= product.getDescription() %></p>
              <p><%= product.getUnitPrice() %>원</p>
            </div>
          <%
                }
          %>
        </div>
      </div>
    
      <jsp:include page="footer.jsp"></jsp:include>
    </body>
    
    </html>