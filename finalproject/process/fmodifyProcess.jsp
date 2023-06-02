<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<%

	int get_num = (int)session.getAttribute("f_num");
	String m_title = request.getParameter("FWtitle");
	String m_body = request.getParameter("FWbody");
	int out_num = 0;

	
Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from forum");
	
	while(rs.next()){
		out_num = rs.getInt("num");
		
		if(get_num == out_num){
			PreparedStatement pstmt = conn.prepareStatement("update forum set title=?, body=? where num=?");
			pstmt.setString(1,m_title);
			pstmt.setString(2,m_body);
			pstmt.setInt(3,get_num);

			pstmt.executeUpdate();
	
			pstmt.close();
			break;
		}
	}
	
	rs.close();
	stmt.close();
	conn.close();
 }catch(SQLException e){

 }
%>
<script>
alert("수정되었습니다.");
location.href = "../forum_list.jsp";
</script>
		