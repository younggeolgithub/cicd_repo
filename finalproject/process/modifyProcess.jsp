<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>
<%
	String call_name=request.getParameter("modiName");
	String isLogin = (String)session.getAttribute("loginID");
	session.setAttribute("loginName",call_name);

Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	PreparedStatement pstmt = conn.prepareStatement("update member set name=? where id=?");

	pstmt.setString(1,call_name);
	pstmt.setString(2,isLogin);

	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
 }catch(SQLException e){

}
%>
<script>
alert("수정되었습니다.")
location.href = "../home.jsp";
</script>