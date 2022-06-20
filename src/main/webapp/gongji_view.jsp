<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<html>
<title>게시글 조회</title>
<head>

<style type = "text/css">
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

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");

	Statement stmt = conn.createStatement();
	Statement stmt2 = conn.createStatement();

	String ids = request.getParameter("key");
	Integer id = 0;
	
   id = Integer.parseInt(ids);
	ResultSet rset = stmt.executeQuery("select * from gongji where id = "+id+";");
	rset.next();
	Integer bunho = rset.getInt(1);//번호

	String title = rset.getString(2); //제목
	Date today = rset.getDate(3); //일자
	String content = rset.getString(4); //내용


%>
<br>
<h2> <%=bunho%>번 게시물 </h2>
<br>
<table border = 1 cellpadding=5>

	<tr>
	<td width=120>번호 </td>
	<td width=480 colspan=3 align=left><input type='hidden' name="id" value=<%=id%>><%=id%></td>
	</tr>
	<tr>
	<td width=120>제목 </td>
	<td width=480 colspan=3 align=left><input type='hidden' name="title" value=<%=title%>><%=title%></td>
	</tr>
	<tr>
	<td width=120>일자 </td>
	<td width=480 colspan=3 align=left><input type='hidden' name="today" value=<%=today%>><%=today%></td>
	</tr>
	<tr>
	<td width=120>내용 </td>
	<td width=480 colspan=3 align=left><input type='hidden' name="content" value=<%=content%>><%=content%></td>
	</tr>
</table>
<br>
<table>
	<tr>
	<td>
	<input type=button onClick=location.href='gongji_list.jsp' value = '목록'></td>
	<td>
	<input type=button onClick=location.href='gongji_update.jsp?key=<%=id%>' value = '수정'> </td>
	<td>
	<input type=button onClick=location.href='gongji_delete.jsp?key=<%=id%>' value = '삭제'> </td>
	</tr>
</table>
<%
	rset.close();
	stmt.close();
	stmt2.close();
	conn.close();

	
%>
</table>
</html>
