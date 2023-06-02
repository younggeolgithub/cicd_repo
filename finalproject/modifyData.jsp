<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<%
	String get_name = null;
	String get_id = null;
	String isLogin = (String)session.getAttribute("loginID");

 Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	
	Statement stmt = conn.createStatement();
	String idSql = "select * from member";
	ResultSet rs = stmt.executeQuery(idSql);
	
	while(rs.next()){
		get_id = rs.getString("id");
		
	if(get_id.equals(isLogin)){
		get_name = rs.getString("name");
		break;
	
		}
	}
	rs.close();
	stmt.close();
	conn.close();
 }catch(SQLException e){
}
%>

<html>
<head>
<style>
#title {
  text-align: left;
  color: green;
  font-size: 64px;
}
a{
 color:#000080;
 text-decoration:none;
 text-align:center;
 font-weight:bold;
}
#table {
  padding: 20;
  margin: auto;
}
body{
  font-family: sans-serif;
  background-image:url("images/thumb.jpg");
  background-repeat:no-repeat;
  background-size: cover;
  margin: 0;
  padding: 0;
}
</style>
</head>
<body>
 <div>
    <jsp:include page="pagedesign/navbar.jsp" flush="false" />
  </div>

<caption><b><p id="title">&nbsp회원정보수정</p></b></caption><br/><br/>
<form action="process/modifyProcess.jsp" method = "post">
<table width=80% border =1 id="table">
<tr>
<td colspan=2>이름:&nbsp<input type="text" size=30 name="modiName" value="<%=get_name%>"></td>
</tr>
<tr>
<td colspan=2 width=50%><a href="passModify.jsp">비밀번호변경</td>
<td colspan=2><input type="submit" value="완료"></td>
</table>
</form>
