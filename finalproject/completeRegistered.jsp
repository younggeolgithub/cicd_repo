<%@ page contentType="text/html;charset=utf-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<style>
body{
  font-family: sans-serif;
  background-image: url("images/msi.jpg");
  background-repeat: no-repeat;
  background-size:100%;
  margin: 0;
  padding: 0;
}
#fontSet {
  font-family:돋움; 
  color: white; 
  font-size:42pt;
  font-weight:900;
  text-align:center;
  vertical-align:middle;
}
a {
 text-decoration:none;
 color:blue;
}

a:hover {
 text-decoration:none;
 color:red;
}
</style>
</head>
<body>
 <div>
    <jsp:include page="pagedesign/navbar.jsp" flush="false" />
  </div>
<p id="fontSet">정상적으로&nbsp등록되었습니다!<br/><br/>
<a href="home.jsp">홈으로가기</a></p>
</body>
</html>