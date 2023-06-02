<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<html>
<head><title>Accessories</title>
<style>
body{
  font-family: sans-serif;
  background-image:url("images/Fondo.png");
  margin: 0;
  padding: 0;
}
table{
  width: 1000px;
  margin-left: 300px;
  margin-top: 50px;
}
td{
  text-align: left;
}
table ,td{
}
.pic {
  width: 80%;
}
th,td {
  padding: 40px;
}
.pic img {
  width: 80%;

}
a{
 font-size:18;
 text-decoration:none;
 color:white;
}
.font{
 font-size:22;
 color:white;
}
#title {
  text-align: left;
  color: white;
  font-size: 64px;
}
</style></head>
<body>
<div>
    <jsp:include page="pagedesign/navbar.jsp" flush="false" />
  </div>
<caption><b><p id="title">&nbsp주변물품</p></b></caption><br/><br/>
<%

	String get_model = null;
	String get_category = null;
	String get_image = null;
	int get_price = 0;
	String isAdmin = (String)session.getAttribute("loginIsAdmin");

Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from accessory");

	while(rs.next()){

		get_model = rs.getString("model");
		get_category = rs.getString("category");
		get_image = rs.getString("image");
		get_price = rs.getInt("price");
%>

 <table>
  <tr>
    <td width=50%>
       <p class="font">모델:&nbsp <%=get_model%><br/>
       분류:&nbsp<%=get_category%><br/>
       가격:&nbsp <%=get_price%></p>
    </td>
    <td class="pic">
<%
  out.print("<img src= images/" + get_image + ">");
%>
    </td>
   </tr>
<%
 }
 rs.close();
 stmt.close();
 conn.close();
}catch(SQLException e){

   }
if( isAdmin != null){
 if(isAdmin.equals("O") ) 
	{
%>
<tr>
<td><font size=12><a href="product_reg_a.jsp" align=center>물품등록</a></font></td>
</tr>
<%
	}
}
%>
</table>
</body>
</html>
