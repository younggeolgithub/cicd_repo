<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<%
	String loginID = (String)session.getAttribute("loginID");

 if(loginID == null){
%>
	<script>
	alert("로그인 후 이용가능합니다.");
	location.href = "login.html";
	</script>
<%
} else {
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

#title {
  text-align: left;
  color: green;
  font-size: 64px;
}

.attribute {
 font-size:20;
 text-align: center;
 font-weight: bold;
}

.table{
 text-align:center;
 width: 90%;
 margin: 30;
}
#write{
 font-size:25px;
 text-align:text-center;
 font-weight:bold;
}
a{
 color:#000080;
 text-decoration:none;
 text-align:center;
 font-weight:bold;
}
a:hover{
 color:purple;
}
</style>
</head>
<body>
<div>
    <jsp:include page="pagedesign/navbar.jsp" flush="false" />
</div>
<caption><b><p id="title">&nbsp포럼</p></b></caption><br/><br/>
<table class="table" frame=below rules=all>
<tr>
<td class="attribute" width=70%>제목</td>
<td class="attribute" width=10%>글쓴이</td>
<td class="attribute" width=10%>글번호</td>
<td class="attribute" width=10%>조회수</td>
</tr>

<%
	String call_title = null;
	String call_id = null;
	int call_num = 0;
	int call_count = 0;
	int click_counter = 0;

Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from forum order by num desc");
	
	while(rs.next()){
		call_title = rs.getString("title");
		call_id = rs.getString("id");
		call_num = rs.getInt("num");
		call_count = rs.getInt("visit_count");
		
%>
		<tr>
		<td><a href="read_form.jsp?get_title=<%=call_title%>"><%=call_title%></a></td>
		<td><%=call_id%></td>
		<td><%=call_num%></td>
		<td><%=call_count%></td>
		</tr>
<%
		}
        rs.close();
        stmt.close();
        conn.close();
   }catch(SQLException e){

   }
%>
</table><br/>
<a href="forum_write.jsp"><p id="write">글쓰기</p></a>
</body>
</html>
<%
}
%>
