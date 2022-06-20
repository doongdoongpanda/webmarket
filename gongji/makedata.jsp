<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.text.*, java.util.*"%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head></head>
<body>
    <h1>Maketable</h1>
</body>
<%
Class.forName("com.mysql.jdbc.Driver");//Class.forName() 을 이용해서 드라이버 로드
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo29");
//DriverManager.getConnection() 으로 해당 주소 mysql의 사용자명,패스워드로 연결 얻기
Statement stmt =conn.createStatement();//자바랑 동일하게 Statement 객체 생성
%>
<%
try{
    stmt.execute("drop table gongji");
    out.println("drop table gongji OK<br>");
    }catch(Exception e){
        out.println("drop table gongji NOT OK<br>");
        out.println(e.toString());
    }
    %>
    



    <% stmt.execute("create table gongji( id int not null primary key auto_increment, title varchar(70),
    date date, content text) DEFAULT CHARSET=utf8");%>
    <%
    String sql ="";
    sql ="insert into gongji(title, date,content) values('공지사항1',date(now()),'공지사항내용1')"; stmt.excute(sql);
    sql ="insert into gongji(title, date,content) values('공지사항2',date(now()),'공지사항내용2')"; stmt.excute(sql);
    sql ="insert into gongji(title, date,content) values('공지사항3',date(now()),'공지사항내용3')"; stmt.excute(sql);
    sql ="insert into gongji(title, date,content) values('공지사항4',date(now()),'공지사항내용4')"; stmt.excute(sql);
    sql ="insert into gongji(title, date,content) values('공지사항5',date(now()),'공지사항내용5')"; stmt.excute(sql);
    

    //execute함수통해 해당 명령어 실행
    stmt.close(); //Statement 함수를 닫는다.
    conn.close(); //Connection  함수를 닫는다.%>
    %>

</body>
</html>
