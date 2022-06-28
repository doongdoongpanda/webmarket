<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>

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
<!--뒤로가기 메서드-->
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
ResultSet rset = stmt.executeQuery("select * from gongji where id = "+id+";");
rset.next();
Integer bunho = rset.getInt(1);
String title = rset.getString(2);
String content = rset.getString(4);
%>
<br>
<h2>게시글 수정/삭제</h2>
<table border=1 cellpadding=5 colspan=5 class="bigtable">
<form method=post action='gongji_write.jsp?key=update&id=<%=id%>'>
	<tr>
	<td width=150>번호 </td>
	<td width=400 colspan=3 align=left><%=bunho%></td>
	</tr>
	<tr>
	<td width=150>제목 </td>
	<td width=400 colspan=3 align=left><input type=text value="<%=title %>" name="title"></input></td>
	</tr>
	<tr>
	<td width=150>일자 </td>
	<td width=400 colspan=3 align=left><%=today%></td>
	</tr>
	<tr>
	<td width=150>내용 </td>
	<td width=400 colspan=1 align=left height=200>
	<textarea name ="content" cols=100 rows=15><%=content%></textarea></td>
	</tr>
</table>
<br>
<table>
	<tr>
	<td><input type=button onClick='goBack();' value = '취소'> </input></td>
	<td>
	<input type=submit value = '쓰기'></input></td>
</form>
	<td><input type=button onClick=location.href='gongji_delete.jsp?id=<%=id%>' value = '삭제'></input></td>
	</tr>
</table>
<%
	rset.close();
	stmt.close();
	conn.close();
%>
</body>
</html>
