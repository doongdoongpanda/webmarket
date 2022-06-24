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
<h2>㈜트와이스 재고 현황 - 상품삭제</h2>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");
	String item= "";
	String photo = "";
	Statement stmt = conn.createStatement();
	String id = request.getParameter("key");	
    ResultSet rset = stmt.executeQuery("select * from inventory2 where id =" + id); // 가장 높은 학번 찾기
    while (rset.next()) {
      item = rset.getString(2); 
      photo = rset.getString(7);
    }
    System.out.println(photo);
	request.setCharacterEncoding("UTF-8");


	//삭제 sql
	String delete = "delete from inventory2 where id = "+id+";";
	stmt.execute(delete);
	Statement stmt2 = conn.createStatement();

	
	String directory = request.getSession().getServletContext().getRealPath("/inventory");
	
	
	
	
	File file = new File(directory + "\\" + photo);
    
	if( file.exists() ){
		if(file.delete()){
			System.out.println("파일삭제 성공");
		}else{
			System.out.println("파일삭제 실패");
		}
	}else{
		System.out.println("파일이 존재하지 않습니다.");
	}
    	

	
	
%>
<h2>[<%=item%>] 상품이 삭제되었습니다.</h2>
<br>
<table>
	<tr>
	<td><input type=button onClick=location.href='inventory_list.jsp'  value = '재고현황'></input></td>
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
