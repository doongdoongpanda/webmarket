<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page import="java.text.SimpleDateFormat,java.util.Date"%>
<html>
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
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String key = request.getParameter("key");

	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");
    
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
    String today = formatter.format(new java.util.Date());

	if("update".equals(key)){
			
		String sql = "update gongji set title=?, date=?, content=? where id = ?;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
	
		pstmt.setString(1, title);
		pstmt.setString(2, today); 
		pstmt.setString(3, content);
		pstmt.setString(4, id);
		pstmt.executeUpdate();
		pstmt.close();
		
		
		%>
	
		<h2><br><%=id%>번 글이 수정되었습니다.</h2>
		<br>
		 <table>
		 <td><input type=button value="목록" Onclick="location.href='inventory_list.jsp'"></td></tr>
		</table>
		
		 <%
	} else if("INSERT".equals(key)){
		
	    int newId = 1;
        int minId = 1;
        int maxId = 1;
        Statement stmt = conn.createStatement();
        ResultSet rset = stmt.executeQuery("select max(id) from gongji"); // 가장 높은 학번 찾기
        while (rset.next()) {
          maxId = rset.getInt(1); 
        }
        
		
		 ResultSet rset2 = stmt.executeQuery("select id from gongji"); // 모든 학번 조회
        while (rset2.next()) {
          newId = rset2.getInt(1);
          if (minId != newId ) {
            newId = minId;
            break;
          }
          if(minId == maxId){
            newId = maxId +1;
            break;
          }
          minId++;
        }

		String sql = "INSERT INTO gongji(id, title, date, content) values(?,?,?,?);";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, newId);
		pstmt.setString(2, title);
		pstmt.setString(3, today); 
		pstmt.setString(4, content);

		pstmt.executeUpdate();
		stmt.close();
		pstmt.close();
		out.println("<h2><br>"+newId+"번글로 입력되었습니다.</h2><br>");
	
%>
		
<table>
 <tr><td><input type=button value="목록" Onclick="location.href='gongji_list.jsp'"></td>
 </tr>
 </table>
<%
	}
	conn.close();

%>
</body>
</html>
