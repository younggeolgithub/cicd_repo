<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<%
	String call_title = request.getParameter("call_title");
%>
<script>
 con=confirm("정말로 삭제하시겠습니까?");
 if(con == true){
<%
Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	PreparedStatement pstmt = conn.prepareStatement("delete from forum where title=?");
	pstmt.setString(1,call_title);

	pstmt.executeUpdate();

	pstmt.close();
	conn.close();
 }catch(SQLException e){

 }
%>
alert("삭제되었습니다.");
location.href = "forum_list.jsp";
} else {
 history.go(-1);
}
</script>
