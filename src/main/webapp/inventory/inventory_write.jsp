<%@page import="java.util.Enumeration"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

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
	
	String item = "";

	String cnt = "";

	String chk = "";

	String rgD = "";

	String detail = "";

	String photos = "";
	String photo = "";
	//파일 경로

	
	
	
	String key = request.getParameter("key");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");

	
	String savePath = null;  // 첨부파일 위치

	//int sizeLimit = 50*1024*1024 ; // 파일 사이즈 (최대 50M 가능)
	savePath = File.separator + "aaa" + File.separator + "bbb"; // 파일 경로 알아서...
	System.out.println(savePath);
	
	
	
	
		//String directory = "C:\\Users\\kopo\\Desktop\\eclipse_workspace\\webMarket\\webmarket\\src\\main\\webapp\\inventory\\upload";
		String directory = request.getSession().getServletContext().getRealPath("/inventory");
		
		System.out.println(directory);
		
		//savePath = directory; // 파일 경로 알아서...
		int sizeLimit = 100*1024*1024;		//100MB 제한
		
		MultipartRequest multi = new MultipartRequest(request, 
							directory, 
	                                               sizeLimit,
	                                               "UTF-8",
	                              	                new DefaultFileRenamePolicy() );
		

		
		int photoLength = 0;
		int i = 0;
		try{
	         Enumeration files = multi.getFileNames();
	 		while(files.hasMoreElements()){
	 			
	 			//mysql상에 저장하기
	 			String name = (String)files.nextElement();
				File file = multi.getFile(name);
				photo =multi.getOriginalFileName(name);//파일명가져오기
				

				photoLength = photo.length();

	           i = photo.lastIndexOf("."); // 파일 확장자 index 위치 찾기
	            //String fileExtension = f_original.substring(i); // 확장자명 자르기
	   
	         photos =  id + photo.substring(i, photoLength);//파일 확장자 따와서 아이디를 붙여서 새로이름지정
 
	         String filePath  = directory + "\\" + photo; //시스템상의 절대경로를 포함한 파일명
	         
	            File f1 = new File(filePath);

	            if (f1.exists()) {
	                File newFile = new File(directory + "\\" + photos); // 새로운 파일 객체 생성
	                boolean rsltt = f1.renameTo(newFile);  //원하는 파일명으로 변경.
	                System.out.println("f1 출력 : " + newFile);
	             }
	          }
	       } catch (Exception e) {
	             System.out.println("파일 없음" + e.getLocalizedMessage());
	       }
	         
	         

	 		//System.out.println(photoLength);
	 		//System.out.println(i);

	 		//System.out.println(photos);
	 		
		
		//while(files.hasMoreElements()){
			//String name = (String)files.nextElement();
			//File file = multi.getFile(name);
			//photo =multi.getOriginalFileName(name);
		//}
			
		
		//텍스트 데이터 베이스에 저장
			Enumeration params=multi.getParameterNames();
		while (params.hasMoreElements()){
			String name=(String)params.nextElement();
			String value=multi.getParameter(name);
			
			
			
			
			
			if(name.equals("currentCount")){
				cnt= value;
			}
			if(name.equals("detail")){
				detail= value;
			}
			if(name.equals("item")){
				item= value;
			}
			if(name.equals("registDate")){
				rgD= value;
			}
			if(name.equals("id")){
				id= value;
			}
			if(name.equals("checkDate")){
				chk= value;
			}
			out.println(name+"="+ value+"<br>");
		}
		//나머지 텍스트도 저장
		String sql = "insert into inventory2(id, item, currentCount, checkDate, registDate, detail, photo) values(?, ?, ?, ?, ?, ? ,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
	
		pstmt.setString(1, id);
		pstmt.setString(2, item);
		pstmt.setString(3, cnt);
		pstmt.setString(4, chk); 
		pstmt.setString(5, rgD); 
		pstmt.setString(6, detail); 
		pstmt.setString(7, photos);
		
		pstmt.executeUpdate();
		pstmt.close();

	
%>

<%
	conn.close();
	//write 파일에서 수정/등록 후 view.jsp 화면 출력
	out.println("<h2><br>"+id+"번글로 입력되었습니다.</h2><br>");
	%>
	<table>
	 <tr><td><input type=button value="목록" Onclick="location.href='inventory_list.jsp'">
	  </td></tr>
 </table>


</body>
</html>
