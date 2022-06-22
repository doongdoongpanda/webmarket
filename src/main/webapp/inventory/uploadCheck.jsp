<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 확인</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    String name         = request.getParameter("name");
    String fileName     = request.getParameter("filename");
    String origFileName = request.getParameter("origfilename");
%>

fileName : <%=fileName %><BR>
origFileName : <%=origFileName %>
NAME : <%=name %>
FILE NAME : <a href="upload/<%=fileName %>"><%=origFileName %></a><br>
</body>
</html>
