<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<% 
	String call_pass = request.getParameter("modiPass");
	String call_passCon = request.getParameter("passCon");
	String isLogin = (String)session.getAttribute("loginID");
	
	if( !call_pass.equals(call_passCon)) {
%>
	<script>
	alert("비밀번호 두 개가 일치하지 않습니다.");
	history.go(-1);
	</script>
<%
	} else {

Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	PreparedStatement pstmt = conn.prepareStatement("update member set pass=? where id=?");

	pstmt.setString(1,call_pass);
	pstmt.setString(2,isLogin);

	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();

} catch(SQLException e) {

   }	
%>
<script>
alert("비밀번호 변경이 완료되었습니다.");
location.href = "../home.jsp";
</script>
<%
}
%>