<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page import="java.text.SimpleDateFormat,java.util.Date"%>
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
function submitForm(mode){
	fm.action ="gongji_write.jsp?key=INSERT";
	fm.submit();
}

</SCRIPT>

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
	//일단 파라미터로 다 받아와보기.
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String rootid = request.getParameter("rootid");
	String relevel = request.getParameter("relevel");
	String recnt = request.getParameter("recnt");
	String viewcnt = request.getParameter("viewcnt");
	//reinsert인지 insert인지 update인지 판가름해줌
	String key = request.getParameter("key");

	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");
    
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
    String today = formatter.format(new java.util.Date());
    int newId = 1;
    //reinsert페이지에서 넘어온 값 처리
    if("reinsert".equals(key)){
	   //아이디 구하기
        int minId = 1;
        int maxId = 1;
        Statement stmt = conn.createStatement();
        ResultSet rset = stmt.executeQuery("select max(id) from gongji"); // 가장 높은 학번 찾기
        while (rset.next()) {
          maxId = rset.getInt(1); 
        }
        newId = maxId + 1;//최대값에서 1 더한 값을 새로운 아이디로 부여
    	//recnt 구하기
		stmt.executeUpdate("update gongji set recnt=" +recnt+" where rootid= "+rootid+" and relevel =" + relevel+" and recnt >=" + recnt+" ;");
		 int relevelint =Integer.parseInt(relevel);
		 int recntint = 0;

   ResultSet rset2 = stmt.executeQuery("select max(recnt) from gongji where rootid = " +rootid+" ;"); 
   while(rset2.next()){
   recntint  =rset2.getInt(1);
   recntint += 1;
   out.println("recntint ="+recntint);
   }
  out.println("recntint ="+recntint);
   Statement stmt2 = conn.createStatement();
	//stmt2.executeUpdate("update gongji set recnt=" + addcnt+" where rootid= "+id+" ;");
    	//그리고 새로 댓글을 삽입해줘야함 
		String sql = "insert into gongji(id, title, date, content, rootid, relevel,recnt) values(?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		out.println("id = "+ newId);
		out.println("title = "+ title);
		out.println("today = "+ today);
		out.println("content = "+ content);
		out.println("root = "+ rootid);
		out.println("relevelint = "+ relevel);
		out.println("recnt = "+ recnt);
		
		
		

		
		pstmt.setInt(1, newId);
		pstmt.setString(2, title);
		pstmt.setString(3, today);
		pstmt.setString(4, content); 
		pstmt.setString(5, rootid); //1
		pstmt.setString(6, relevel); //1,2,..
		pstmt.setString(7, recnt); //1,2,..
		pstmt.executeUpdate();
		
		
		stmt.close();
		stmt2.close();
		//stmt3.close();
		pstmt.close();
	%>
			
		<h2><br>댓글이 <%=newId%>번째로 작성되었습니다.</h2>
		<br>
		 <table>
		 <tr>
		 <td><input type=button value="목록" Onclick="location.href='gongji_list.jsp'"></td></tr>
		</table>
		

<%
    }
    
	if("update".equals(key)){
			
		String sql = "update gongji set title=?, date=?, content=? where id = ?;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		//out.println(title + "ddd");
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
		 <td><input type=button value="목록" Onclick="location.href='gongji_list.jsp'"></td></tr>
		</table>
		
		 <%
	} else if("INSERT".equals(key)){
		
	   
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
		int root = newId;

		int relevelint = 0;
		int recntint = 0;
		
		String sql = "insert into gongji(id, title, date, content, rootid, relevel,recnt) values(?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		out.println("id = "+ newId);
		out.println("title = "+ title);
		out.println("today = "+ today);
		out.println("content = "+ content);
		out.println("root = "+ root);
		out.println("relevelint = "+ relevelint);
		out.println("recntint = "+ recntint);
		
		
		
		
		pstmt.setInt(1, newId);
		pstmt.setString(2, title);
		pstmt.setString(3, today);
		pstmt.setString(4, content); 
		pstmt.setInt(5, root); //1
		pstmt.setInt(6, relevelint); //0
		pstmt.setInt(7, recntint); //0
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
