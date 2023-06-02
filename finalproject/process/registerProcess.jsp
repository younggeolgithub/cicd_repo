<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<%
	String get_id = request.getParameter("id");
	String get_pass = request.getParameter("pass");
	String get_pass2 = request.getParameter("pass2");
	String get_name = request.getParameter("name");
	String data_id = null;
	boolean id_overlap = false;

Class.forName("oracle.jdbc.driver.OracleDriver");

 if(get_pass.equals(get_pass2))
{

 try {
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	
	Statement stmt = conn.createStatement();
	PreparedStatement pstmt2 = conn.prepareStatement("Insert into member values (?,?,?,?)");
	ResultSet rs = stmt.executeQuery("select * from member");
	
	while(rs.next()){  //아이디 중복 체크 루프
	data_id = rs.getString("id");
	if(data_id.equals(get_id)){
		id_overlap = true;
		}
	 }
	
	if(id_overlap){ 
%>
	<script>
	alert("중복되는 아이디가 있습니다.");
	history.go(-1);
	</script>
<%
	} else {
	pstmt2.setString(1,get_id);
	pstmt2.setString(2,get_pass);
	pstmt2.setString(3,get_name);
	pstmt2.setString(4,"X");
	
	pstmt2.executeUpdate();

	}

 	
	rs.close();
	pstmt2.close();
	stmt.close();
	conn.close();
 }catch(SQLException e){

 }
	if(!id_overlap){
		response.sendRedirect("../completeRegistered.jsp");
  	}
} else {
%>
<script>
 alert("비밀번호가 일치하지 않습니다.");
 history.go(-1);
</script>
<%
}
%>

