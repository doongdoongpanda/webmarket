<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String directory = "C:\\Users\\kopo\\Desktop\\eclipse_workspace\\webMarket\\webmarket\\src\\main\\webapp\\inventory\\upload";
	int sizeLimit = 100*1024*1024;		//100MB 제한
	
	MultipartRequest multi = new MultipartRequest(request, directory, sizeLimit, "UTF-8",
                              	                new DefaultFileRenamePolicy() );
%>


<a href="#" onclick="javascript:uploadCheck.submit()">업로드 체크 및 다운로드 페이지로 이동</a>
</body>
</html>