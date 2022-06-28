<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
 <%@ page import="java.text.SimpleDateFormat,java.util.Date"%>
<html>
<head>

<title>게시판</title>
<style type = "text/css">
  .bigtable {
   border-collapse : collapse;
    border: 1px solid grey;
  }
    .smalltable {
    text-align:center;
  }
  table {
  	margin:auto;
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
<table border = 1 width=770 cellpadding=5 colspan=5 class="bigtable">
	<tr align=center>
	<td width=80>번호 </td>
	<td width=300>제목 </td>
	<td width=80>조회수 </td>
	<td width=200>등록일 </td>
	</tr>
<%

//페이지 설정위한 변수 설정
int totaldata = 0;  
int countpage = 5;  
int datalist = 10;  
int totalpage = 0;  
int linecount = 0;
int bundle = countpage * datalist; //50
int lastIndex = bundle - datalist; //40
String starts = request.getParameter("togo"); 

int start;    
try{
    start = Integer.parseInt(starts);        
} catch (Exception e){
    start = 0;  
}

if(start <0){
     start = 0;

} 


java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
String today = formatter.format(new java.util.Date());

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");
	Statement stmt = conn.createStatement();
	ResultSet rset = stmt.executeQuery("select * from gongji order by rootid desc, relevel asc;");
	while(rset.next()){
		int id = rset.getInt(1);
		String title = rset.getString(2);
		int relevel = rset.getInt(6);
		String date = rset.getString(3);
		String sign = "";
		String newSign ="";
		
		
		if (linecount < start){         
	          linecount++; 

	          continue;
	      }
		
		for( int i = 0; i< relevel; i++){
			 sign += "<img src='redat.png' width =20px>";
		}
		
		if(today.equals(date)){
		newSign = "<img src='new.png' width =25px>";
		}
		title = sign + title + newSign;
%>
	<tr>
	<td align=center><%=id%></td>
	<td><a href='gongji_view.jsp?key=<%=id%>'><%=title%></a></td>
	<td align=center><%=rset.getInt(8) %></td>
	<td align=center><%=rset.getString(3)%></td>
	</tr>
<%
linecount++;

if(linecount >= start+datalist){
       break;
 }
}
	

ResultSet rset3 = stmt.executeQuery("select count(*) from gongji;");
rset3.next();
totaldata = rset3.getInt(1); // 전체 데이처 수 계산

if(totaldata != 0){
  if((totaldata % datalist) == 0){
     totalpage = (totaldata/datalist);
  }else{
     totalpage = (totaldata/datalist) + 1;
  } 
}      
if(start >= (totalpage*datalist)-datalist){
  start = (totalpage*datalist)-datalist;
}   // 맨마지막 페이지를 클릭 했을때 다음 페이지로 넘어가못하도록 출력되는 페이지의 한계숫자를 조정
String before = "<<";    
String nextt = ">>";


 int startpage = (start/(countpage*datalist)) * countpage +1;  

 int endpage = startpage + countpage-1;


if(endpage > totalpage) {

   endpage = totalpage;

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
	rset3.close();
	stmt.close();

	conn.close();

%>
</tr>
</table>



<table cellspacing=1 width=200 class="smalltable">
<tr rowspan=3>
<td></td>

<%
//페이지 번호 출력
int beforee = 0;
if(start>=0){

		 beforee  = start; 
		 int aa = (start/bundle)*bundle-datalist;
				//out.println(aa+"???");
				 beforee  =aa;
		if(aa <= 0){
			beforee= 0;
		}

   out.println("<td width=80><a href=gongji_list.jsp?togo="+ beforee +">"+" "+ before +" "+"</a></td>");

}
 for(int i = startpage; i <= endpage; i++){
	 if (i == start){          
         out.println("<td width=200><a href =gongji_list.jsp?togo="+ (i-1)*datalist +"><b>"+" "+i+" "+"</b></a></td>");
       }        
    else {
  out.println("<td width=200><a href = gongji_list.jsp?togo="+ (i-1)*datalist +"><b>"+" "+i+" "+"</b></a></td>");   
 }    

    }
 int next = 0;


    if (start <= totalpage*datalist) {    
		
    	next = (start+datalist); //마지막이 50
 int aa = ((start+bundle)/bundle)*bundle;
		
		next =aa;
	
		if(next>=totaldata){
			next=(totalpage-1)*datalist;
		
	} 
		out.println("<td width=80><a href=gongji_list.jsp?togo="+ (next) +">"+" "+ nextt +" "+"</a></td>");

    } 

//마지막페이지
    if (endpage <= totalpage) {	

		totalpage = (totalpage-1)*datalist;

	} 		

   
%>

</tr>
</table>


</body>
</html>
