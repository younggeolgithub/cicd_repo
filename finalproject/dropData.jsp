<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<script>
var warning;

 warning = confirm("정말로 탈퇴하시겠습니다까?");

if(warning == true) 
{
<%
	String isLogin=(String)session.getAttribute("loginID");

Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	PreparedStatement pstmt = conn.prepareStatement("delete from member where id=?");
	
	pstmt.setString(1,isLogin);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();

}catch(SQLException e){

   }
 session.invalidate();
%>

alert("회원 탈퇴가 완료되었습니다.");
location.href = "home.jsp";
} else {
history.go(-1);
}
</script>