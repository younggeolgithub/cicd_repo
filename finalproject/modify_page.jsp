<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<%
	String call_title = request.getParameter("call_title");
	String out_title = null;
	String call_body = null;
	int call_num = 0;

Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from forum");
	
	while(rs.next()){
		out_title = rs.getString("title");
		
		if(call_title.equals(out_title)){
			call_body = rs.getString("body");
			call_num = rs.getInt("num");
			break;
		}
	}
	session.setAttribute("f_num",call_num);

	rs.close();
	stmt.close();
	conn.close();
 }catch(SQLException e){

 }		
%>
<html>
<head>
<style>
body{
  font-family: sans-serif;
  background-color: #EEFFFF;
  margin: 0;
  padding: 0;
}

#table {
  padding: 20;
  margin: auto;
}
#title {
  text-align: left;
  color: green;
  font-size: 64px;
}
.attri{
  text-align:center;
}
</style>
</head>
<body>
<div>
    <jsp:include page="pagedesign/navbar.jsp" flush="false" />
</div>
<caption><b><p id="title">&nbsp수정</p></b></caption><br/><br/>
<form action="process/fmodifyProcess.jsp" method="post">
<table id="table" frame=below width=70%>
<tr>
<td class="attri"><b>제목: </b><input type="text" size=103 name="FWtitle" value=<%=call_title%>></td>
</tr>
<tr>
<td class="attri"><textarea rows=20 cols=100 name="FWbody" value><%=call_body%></textarea></td>
</tr>
<tr>
<td class="attri"><input type=submit value="수정"></td>
</tr>
</table>
</body>
</html>