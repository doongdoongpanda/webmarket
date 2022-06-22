<%@page import="java.util.Enumeration"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
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
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
String today = formatter.format(new java.util.Date());
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String cnt = "";
	String count = request.getParameter("count");

	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");

		//String directory = "C:\\Users\\kopo\\Desktop\\eclipse_workspace\\webMarket\\webmarket\\src\\main\\webapp\\inventory\\upload";
		//String directory = request.getSession().getServletContext().getRealPath("/inventory");
		//System.out.println(directory);
				String directory = request.getSession().getServletContext().getRealPath("/inventory");
		System.out.println(directory);
		int sizeLimit = 100*1024*1024;	
		
		
		MultipartRequest multi = new MultipartRequest(request, 
							directory, 
	                                               sizeLimit,
	                                               "UTF-8",
	                              	                new DefaultFileRenamePolicy() );
		
		Enumeration params=multi.getParameterNames();
		while (params.hasMoreElements()){
			String name=(String)params.nextElement();
			String value=multi.getParameter(name);
			if(name.equals("count")){
				cnt= value;
			}
			
			out.println(name+"="+ value+"<br>");
		}
		String sql = "update inventory2 set currentCount=?, registDate=? where id = ?;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
	
		
		
		pstmt.setString(1, cnt);
		pstmt.setString(2, today);
		pstmt.setString(3, id);
		pstmt.executeUpdate();
		pstmt.close();
		%>

		<h2><br><%=id%>번 글이 수정되었습니다.</h2>
		<br>
		 <table>
		 <td><input type=button value="목록" Onclick="location.href='inventory_list.jsp'"></td></tr>
		</table>
		

	


</body>
</html>
