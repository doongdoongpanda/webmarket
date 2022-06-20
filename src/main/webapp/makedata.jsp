<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.text.*, java.util.*"%>
<head></head>
<body>
    <h1>Maketable</h1>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");
Statement stmt =conn.createStatement();
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
    <% stmt.execute("create table gongji( id int not null primary key auto_increment, title varchar(70), date date, content text) DEFAULT CHARSET=utf8");
    %>
    <%
    String sql ="";
    sql ="insert into gongji(title, date, content) values('공지사항1',date(now()),'공지사항내용1')"; stmt.execute(sql);
    sql ="insert into gongji(title, date,content) values('공지사항2',date(now()),'공지사항내용2')"; stmt.execute(sql);
    sql ="insert into gongji(title, date,content) values('공지사항3',date(now()),'공지사항내용3')"; stmt.execute(sql);
    sql ="insert into gongji(title, date,content) values('공지사항4',date(now()),'공지사항내용4')"; stmt.execute(sql);
    sql ="insert into gongji(title, date,content) values('공지사항5',date(now()),'공지사항내용5')"; stmt.execute(sql);
    

    //execute함수통해 해당 명령어 실행
    stmt.close(); //Statement 함수를 닫는다.
    conn.close(); //Connection  함수를 닫는다.
    %>
</body>
</html>
