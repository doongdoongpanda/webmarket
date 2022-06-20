<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<html>
<head>

<title>게시판</title>
<style type = "text/css">
  table {
  	margin:auto;
    text-align: center;
    border: 1px; 
  }
h2 {
   text-align:center;
}   
</style>
</head>
<br>
<h2>게시판 목록</h2>
<body>
<table border = 1 width=770 cellpadding=5 colspan=5>
	<tr>
	<td width=120>번호 </td>
	<td width=300>제목 </td>
	<td width=200>등록일 </td>
	</tr>
<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");
//sql쿼리 생성/실행을 위한 statement객체 생성
	Statement stmt = conn.createStatement();
	ResultSet rset = stmt.executeQuery("select * from gongji order by id desc;");
	while(rset.next()){
		int id = rset.getInt(1);

%>
	<tr>
	<td><%=id%></td>
	<td><a href='gongji_view.jsp?key=<%=id%>'><%=rset.getString(2)%></a></td>
	<td><%=rset.getString(3)%></td>
	</tr>
<%
	}
%>
</table>
<br>
<table>
<tr><td width=600></td><td><input align=right type=submit onClick=location.href='gongji_insert.jsp'
		value = 신규></input></td></tr>

</table>
<table cellspacing=1 width=400 style="font-size:20;">
<tr>

<%
	rset.close();
	stmt.close();
	conn.close();

%>
</tr>
</table>


</body>
</html>
