<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<html>
<title>게시글 삭제</title>
<head>
<style type = "text/css">
table {
   margin:auto;
   text-align: center;
}   
h2 {
   text-align:center;
}   
</style>
</head>
<br>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");

	Statement stmt = conn.createStatement();
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("key");

	//삭제 sql
	String delete = "delete from gongji where id = "+id+";";
	stmt.execute(delete);
	Statement stmt2 = conn.createStatement();

%>
<h2><%=id%>번 글이 삭제되었습니다.</h2>
<br>
<table>
	<tr>
	<td><input type=button onClick=location.href='gongji_list.jsp'  value = '확인'></input></td>
	</tr>
</table>

<%
	stmt.close();
	conn.close();
} catch(Exception e) {
 	out.println("에러가 발생했습니다.<br>");
            
         
 }  
%>
</body>
</html>
