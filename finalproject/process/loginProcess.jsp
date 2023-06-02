<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<%
	String call_id = null;
	String call_pass = null;
	String call_name = null;
	String call_isAdmin = null;
	String submit_id = request.getParameter("id");
	String submit_pass = request.getParameter("pass");
	boolean match_id = false;
	int count = 0;

Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	
	Statement stmt = conn.createStatement();
	String idSql = "select * from member";
	ResultSet rs = stmt.executeQuery(idSql);

	while(rs.next()){
		count+=1;
		call_id = rs.getString("id");
		call_pass = rs.getString("pass");
		call_name = rs.getString("name");
		call_isAdmin = rs.getString("isAdmin");
		
		
		if(submit_id.equals(call_id) && submit_pass.equals(call_pass)) {
			match_id = true;
			break;
		}
	}

	rs.close();
	stmt.close();
	conn.close();
 }catch(SQLException e){

}

 if(match_id){
	session.setAttribute("loginID",submit_id);
	session.setAttribute("loginName",call_name);
	session.setAttribute("loginIsAdmin",call_isAdmin);
			
	response.sendRedirect("../home.jsp");
 } else {
%>
<script>
alert("아이디나 패스워드가 다릅니다. <%=count%>");
history.go(-1);
</script>
<%
 }
%>
