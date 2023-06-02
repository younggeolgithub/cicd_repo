<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<%

	String get_title = request.getParameter("get_title");
	int call_vcount =0;
	String call_id = null;
	String call_body = null;
	String out_title = null;
	String get_loginID = (String)session.getAttribute("loginID");
	String get_isAdmin = (String)session.getAttribute("loginIsAdmin");


Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from forum");

	while(rs.next()){
		out_title = rs.getString("title");

		if(get_title.equals(out_title)){
			call_id = rs.getString("id");
			call_body = rs.getString("body");
			call_vcount = rs.getInt("visit_count");
			break;
		}
	}
	call_vcount += 1;
	PreparedStatement pstmt = conn.prepareStatement("update forum set visit_count=? where title=?");
	pstmt.setInt(1,call_vcount);
	pstmt.setString(2,get_title);

	pstmt.executeUpdate();
	
	pstmt.close();
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
a{
  color:blue;
  text-decoration:none;
}
a:hover{
  color:magenta;
}
.text{
 vertical-align:text-top;
}
</style>
</head>
<body>
<div>
    <jsp:include page="pagedesign/navbar.jsp" flush="false" />
</div>
<table id="table" width=70% frame="below" border=1>
<tr>
<td colspan="3">제목:&nbsp<%=get_title%></td>
</tr>
<tr>
<td>글쓴이:&nbsp<%=call_id%></td>
<td colspan="2" align=center>조회수:&nbsp<%=call_vcount%></td>
</tr>
<tr height=400>
<td colspan="3" valign=top><p class="text"><%=call_body%></p></td>
</tr>
<tr>
<td align=center><a href="forum_list.jsp">나가기</a></td>
<%
  if( get_loginID.equals(call_id) || get_isAdmin.equals("O")){
%>
<td align=center><a href="delete_page.jsp?call_title=<%=get_title%>">삭제</a></td>
<td align=center><a href="modify_page.jsp?call_title=<%=get_title%>">수정</a></td>
<%
 }
%>
</tr>
</table>
</body>
</html>
		