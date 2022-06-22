<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*"%>
<%@ page import="java.text.SimpleDateFormat,java.util.Date"%>
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
function submitForm(mode){
	fm.action ="inventory_write.jsp?key=INSERT";
	fm.submit();
}
</SCRIPT>


<style type = "text/css">
  table {
	margin:auto;
    text-align: center;
    border: 1px;
  }
h2 {
   text-align:center;
}


 
</style>
</head>
<br>
<h2>㈜트와이스 재고 현황 - 상품등록</h2>
<%
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
String today = formatter.format(new java.util.Date());
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:33061/kopoctc","root","kopo29");
Statement stmt = conn.createStatement();
Statement stmt2 = conn.createStatement();

int id = 0;
ResultSet rset = stmt.executeQuery("select max(id) from inventory2;");
rset.next();
id = rset.getInt(1)+1;
%>
<br>

<table border = 1 cellpadding=5>
<form method=post action='inventory_write.jsp?key=INSERT&id=<%=id%>' enctype="multipart/form-data">
	<tr>
	<td width=120>상품번호 </td>
	<td width=480 align=left><input readonly type=number name='id' value=<%=id%>></input></td>
	</tr>
	<tr>
	<td width=120>상품명 </td>
	<td width=480 align=left><input required type=text name ='item'></input></td>
	</tr>
		<tr>
	<td width=120>재고 현황 </td>
	<td width=480 align=left><input required type=number name='currentCount'></input></td>
	</tr>
	<tr>
	<td width=120>상품등록일 </td>
	<td width=480 align=left><input type='hidden' required name='checkDate' value="<%=today%>"><%=today%></input></td>
	</tr>
		<tr>
	<td width=120>재고등록일 </td>
	<td width=480 align=left><input type='hidden' name='registDate' value="<%=today%>" required><%=today%></input></td>
	</tr>
	<tr>
	<td width=120>상품설명 </td>
	<td width=480 align=left><input type=text name='detail' required></input></td>
	</tr>
		<tr>
	<td width=120>상품사진 </td>
	<td width=480 colspan=3 align=left>
	<input type=file accept="image/*" name="photo" id="myFile" >
	
	<img id="View"></td>
	</tr>
</table>
<br>

<%
	rset.close();
	stmt.close();
	stmt2.close();
	conn.close();
%>

</html>

<table>
	<tr>
	<td width = 500></td>
	<td><input type=button onClick="location.href='inventory_list.jsp'" value = '취소'> </input></td>
	<td>
	<input type=submit value = '완료'></input></td>
	</tr>
</table>
<script src="http://madalla.kr/js/jquery-1.8.3.min.js"></script>

<script type="text/javascript">

$(function() {
    $("#myFile").on('change', function(){
    readURL(this);
    });
});
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        $('#View').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
</script>

</form>
<%
	rset.close();
	stmt.close();
	conn.close();



%>

</body>

</html>

