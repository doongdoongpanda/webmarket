<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table cellspacing=1 width=600 border=1>
<tr>
<td width=50><p align=center>번호</p></td>
<td width=500><p align=center>제목</p></td>
<td width=100><p align=center>등록일</p></td>
</tr>
<tr>
<td width=50><p align=center>1</p></td>
<td width=500><p align=center><a href='gongji_view.jsp?key=1'>공지사항1</a></p></td>
<td width=100><p align=center>2022-06-14</p></td>
</tr>
<tr>
<td width=50><p align=center>1</p></td>
<td width=500><p align=center><a href='gongji_view.jsp?key=2'>공지사항2</a></p></td>
<td width=100><p align=center>2022-06-14</p></td>
</tr>
</table>

<table width=650>
<tr>
<td width=550></td>
<td><input tpe= button value="신규" OnClick="window.location='gongji_insert.jsp'"></td>

</tr>
</table>

</body>
</html>