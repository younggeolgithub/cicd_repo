<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<%
	String isLogin = (String)session.getAttribute("loginID");
	String get_id = null;
	String get_name = null;

Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from member");

	while(rs.next()){
		get_id = rs.getString("id");
		get_name = rs.getString("name");

		if (isLogin.equals(get_id)){
	
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
a{
 color:#000080;
 text-decoration:none;
 text-align:center;
 font-weight:bold;
}
#title {
  text-align: left;
  color: green;
  font-size: 64px;
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

<caption><b><p id="title">&nbsp회원정보</p></b></caption><br/><br/>
<table width=80% border =1 id="table">
<tr>
<td colspan=2>아이디:&nbsp<%=get_id%></td>
</tr>
<tr>
<td colspan=2>이름:&nbsp<%=get_name%></td>
</tr>
<td width=50%><a href="modifyData.jsp">회원정보수정</a></td>
<td><a href="dropData.jsp">회원탈퇴</a></td>
</tr>
</table>
</form>





 