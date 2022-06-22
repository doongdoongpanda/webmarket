<%@page import="javax.swing.ImageIcon"%>
<%@page import="javax.swing.JLabel"%>
<%@page import="java.awt.Image"%>
<%@page import="java.net.URL"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<html>

<head>

<style type = "text/css">
  .bigtable {
   border-collapse : collapse;
  	margin:auto;
    text-align: center;
    border: 1px solid black;
  }
  table {
	margin:auto;
    text-align: center;
    border: 1px ;
  }
h2 {
   text-align:center;
}   
</style>
</head>
<br>
<h2>㈜트와이스 재고 현황 - 상품상세</h2>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");
Statement stmt = conn.createStatement();

	String ids = request.getParameter("id");
	Integer id = 0;
	
   id = Integer.parseInt(ids);
	ResultSet rset = stmt.executeQuery("select * from inventory2 where id = "+id+";");
	rset.next();
	Integer bunho = rset.getInt(1);//번호
	String item = rset.getString(2); //상품명
	Integer currentCount = rset.getInt(3); //개수
	Date checkDate = rset.getDate(4); //체크일자
	Date registDate = rset.getDate(5); //등록일자
	String content = rset.getString(6); //내용
	String photo = rset.getString(7); //사진명
%>
<br>

<table border = 1 cellpadding=5 class="bigtable">

	<tr>
	<td width=120>상품번호 </td>
	<td width=480 colspan=3 align=left><%=bunho%></td>
	</tr>
	<tr>
	<td>상품명 </td>
	<td colspan=3 align=left><%=item%></td>
	</tr>
		<tr>
	<td >재고 현황 </td>
	<td colspan=3 align=left><%=currentCount%></td>
	</tr>
	<tr>
	<td>상품등록일 </td>
	<td colspan=3 align=left><%=checkDate%></td>
	</tr>
		<tr>
	<td>상품등록일 </td>
	<td colspan=3 align=left><%=registDate%></td>
	</tr>
	<tr>
	<td>상품설명 </td>
	<td colspan=3 align=left><%=content%></td>
	</tr>
		<tr>
	<td>상품사진 </td>
	<td colspan=3 align=left>
	<img class="photo" src="/inventory/<%=photo%>"></td>
	</tr>
</table>
<br>
<table>
	<tr>
	<td width=420>
	</td><td>
	<input type=button onClick=location.href='inventory_list.jsp' value = '목록'></td>
	<td>
	<input type=button onClick=location.href='inventory_delete.jsp?key=<%=id%>' value = '상품삭제'> </td>
	<td>
	<input type=button onClick=location.href='inventory_update.jsp?key=<%=id%>' value = '재고수정'> </td>
	</tr>
</table>
<%
	rset.close();
	stmt.close();

	conn.close();

	
%>
</table>
</html>
