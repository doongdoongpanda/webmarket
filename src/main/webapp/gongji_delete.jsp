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
	Connection conn = 
			DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");

	Statement stmt = conn.createStatement();
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("key");
	String rootid = request.getParameter("rootid");
	String relevel = request.getParameter("relevel");
	String recnt = request.getParameter("recnt");

	//삭제 sql
	String delete = "delete from gongji where id = "+id+";";
	stmt.execute(delete);
	Statement stmt2 = conn.createStatement();
	
	//하나씩 땅겨야함
	//삭제 후 해당 rootid와 recnt를 가진 게시물의 recnt를 하나 앞 당겨 준다
	stmt2.executeUpdate("update gongji set recnt=recnt-1 where rootid="+rootid+" and relevel = "+relevel+" and recnt>= "+recnt+" ;");
	stmt2.executeUpdate("update gongji set id=id-1 where id >= "+id+" ;");


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
stmt2.close();
	conn.close();
} catch(Exception e) {
 	out.println("에러가 발생했습니다.<br>"+e);
            
         
 }  
%>
</body>
</html>
