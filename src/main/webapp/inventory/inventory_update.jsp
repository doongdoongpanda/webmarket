<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

<%@ page import="java.text.SimpleDateFormat,java.util.Date"%>

<html>
<title>게시글 수정</title>
<head>
<%
 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
 String today = formatter.format(new java.util.Date());

%>
<style type = "text/css">
  .bigtable {
   border-collapse : collapse;
  	margin:auto;
    text-align: center;
    border: 1px solid black;
  }
  table{
  text-align: center;
  	margin:auto;
  }
h2 {
   text-align:center;
}   
</style>
<script type="text/javascript">
function goBack(){
window.history.back();
}
</script>
</head>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");
Statement stmt = conn.createStatement();
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("key");
ResultSet rset = stmt.executeQuery("select * from inventory2 where id = "+id+";");
rset.next();
Integer iD = rset.getInt(1);
String item = rset.getString(2);
Integer count = rset.getInt(3);
String chD = rset.getString(4);
String rgD = rset.getString(5);
String detail = rset.getString(6);
String photo = rset.getString(7);
%>

<br>
<h2>㈜트와이스 재고 현황 - 재고수정</h2>
<table border=1 cellpadding=5 colspan=5 class="bigtable">
<form method=post action='inventory_write2.jsp?id=<%=iD%>' enctype="multipart/form-data">
	<tr>
	<td width=200>상품번호 </td>
	<td width=400 colspan=3 align=left><%=iD%></td>
	</tr>
	<tr>
	<td width=200>상품명 </td>
	<td width=400 colspan=3 align=left><%=item%></td>
	</tr>
	<tr>
	<td width=200>재고현황 </td>
	<td width=400 colspan=3 align=left><input type=text name="count" value=<%=count%> required></input></td>
	</tr>
	<tr>
	<td width=200>상품등록일 </td>
	<td width=400 colspan=3 align=left><%=chD%></td>
	</tr>
	<tr>
	<td width=200>재고등록일 </td>
	<td width=400 colspan=3 align=left><%=today%></td>
	</tr>
	<tr>
	<td width=200>상품설명 </td>
	<td width=400 colspan=1 align=left height=200><%=detail%></textarea></td>
	</tr>
		<tr>
	<td width=120>상품사진 </td>
	<td width=480 colspan=3 align=left>
	<img class="photo" src="/inventory/<%=photo%>"></td>
	</tr>
</table>
<br>
<table>
	<tr>
	<td ></td></tr>
	
	<tr><td width=550></td>
	<td><input type=button onClick='goBack();' value = '취소'> </input></td>
	<td>
	<input type=submit value = '재고수정'></input></td>
</form>
	</tr>
</table>

<%
	rset.close();
	stmt.close();
	conn.close();
%>
</body>
</html>
