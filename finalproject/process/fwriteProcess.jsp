<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<%
	int call_num = 1;
	String call_title = request.getParameter("FWtitle");
	String call_id = (String)session.getAttribute("loginID");
	String call_body = request.getParameter("FWbody");
	int call_vcount = 0;

Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	
	Statement stmt = conn.createStatement();
	PreparedStatement pstmt = conn.prepareStatement("insert into forum values (?,?,?,?,?)");
	ResultSet rs = stmt.executeQuery("select * from forum");

	while(rs.next()){
		call_num += 1;
	}
	
	pstmt.setInt(1,call_num);
	pstmt.setString(2,call_title);
	pstmt.setString(3,call_id);
	pstmt.setString(4,call_body);
	pstmt.setInt(5,call_vcount);

	pstmt.executeUpdate();

	rs.close();
	pstmt.close();
	stmt.close();
	conn.close();
 }catch(SQLException e){

}
%>
<script>
 alert("등록되었습니다. ");	
 location.href = "../forum_list.jsp";
</script>
