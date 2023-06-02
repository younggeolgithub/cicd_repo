<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,
                   com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                   java.io.*" %>
<%@ page import="thinkonweb.util.*" %> 

<%
   request.setCharacterEncoding("utf-8");
%>

<% 
  String savePath = application.getRealPath("images");
  int sizeLimit = 5 * 1024 * 1024 ; 
  
  MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());  
  
  File file = multi.getFile("image"); 
  
  String fileName=file.getName(); 
  long fileSize=file.length(); 

  String model_name = multi.getParameter("model");
  String category = multi.getParameter("category");
  int price = Integer.parseInt(multi.getParameter("price"));
  String out_model = null;
   
  Class.forName("oracle.jdbc.driver.OracleDriver");

try{
	String url = "jdbc:oracle:thin:@localhost:1521";
	Connection conn = DriverManager.getConnection(url,"admin","wer97531");
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from accessory");
	PreparedStatement pstmt = conn.prepareStatement("Insert into accessory values (?,?,?,?)");
	
	while(rs.next()) {
		out_model = rs.getString("model");
		if(model_name.equals(out_model)){
%>
		<script>
		alert("중복된 모델이 있습니다.");
		history.go(-1);
<%
		}
	}
	pstmt.setString(1, model_name);
	pstmt.setString(2, category);
	pstmt.setString(3, fileName);
	pstmt.setInt(4, price);

	pstmt.executeUpdate();

	pstmt.close();
	conn.close();

}catch(SQLException e){

}

%> 
<script>
 location.href="../accessories.jsp";
</script>

