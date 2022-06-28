
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<html>
<head>
<br>
<style type = "text/css">

  table {
  
	margin:auto;
    text-align: center;
    border: 2px; 
  }
h2 {
   text-align:center;
}
a{ 

text-decoration: none; 

}
</style>
<h2>㈜트와이스 재고 현황 - 전체현황</h2>
</head>
<br>

<body>

<table border = 1 width=800>
	<tr>
	<td width=120>상품번호 </td>
	<td width=280>상품명 </td>
	<td width=200>현재 재고수 </td>
	<td width=300>재고파악일 </td>
	<td width=300>상품등록일 </td>
	</tr>

<%

try{
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
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");
Statement stmt = conn.createStatement();
Statement stmt2 = conn.createStatement();
ResultSet rset = stmt.executeQuery("select * from inventory2 order by id asc;");
while(rset.next()){
		int id = rset.getInt(1);
      if (linecount < start){         
          linecount++; 

          continue;
      }
%>

	<tr>

	<td><%=id%></td>

	<td><a href='inventory_view.jsp?id=<%=id%>'><%=rset.getString(2)%></a></td>

	<td><%=rset.getInt(3)%></td>

	<td><%=rset.getDate(4)%></td>

	<td><%=rset.getDate(5)%></td>

	</tr>

<%
	linecount++;

	if(linecount >= start+datalist){
           break;
     }
}
	ResultSet rset2 = stmt2.executeQuery("select count(*) from inventory2;");
	rset2.next();

   totaldata = rset2.getInt(1); // 전체 데이처 수 계산
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
<table>
<tr><td width=700></td><td><input align=right type=submit onClick=location.href='inventory_register.jsp' value = 신규등록></input></td>
</tr></table>

<table cellspacing=1 width=400>
<tr rowspan=3>
<td></td></tr>

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

   out.println("<td width=80><a href=inventory_list.jsp?togo="+ beforee +">"+" "+ before +" "+"</a></td>");

}
 for(int i = startpage; i <= endpage; i++){
	 if (i == start){          
         out.println("<td width=200><a href = inventory_list.jsp?togo="+ (i-1)*datalist +"><b>"+" "+i+" "+"</b></a></td>");
       }        
    else {
  out.println("<td width=200><a href = inventory_list.jsp?togo="+ (i-1)*datalist +"><b>"+" "+i+" "+"</b></a></td>");   
 }    

    }
 int next = 0;


    if (start <= totalpage*datalist) {    
		
    	next = (start+datalist); //마지막이 50
 int aa = ((start+bundle)/bundle)*bundle;
		
		next =aa;
	
		if(next>=totaldata){
			next=(totalpage-1)*datalist;
			//out.println(next+"!!!");
	} 
		out.println("<td width=80><a href=inventory_list.jsp?togo="+ (next) +">"+" "+ nextt +" "+"</a></td>");

    } 

//마지막페이지
    if (endpage <= totalpage) {	

		totalpage = (totalpage-1)*datalist;

	} 		
	rset.close();

	stmt.close();

	conn.close();

} catch(Exception e) {
            out.println(" 에러가 발생했습니다.");
         }
   
%>

</tr>
</table>
</body>
</html>