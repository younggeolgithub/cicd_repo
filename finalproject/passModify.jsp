<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<html>
<head>
<style>
#title {
  text-align: left;
  color: green;
  font-size: 64px;
}
a{
 color:#000080;
 text-decoration:none;
 text-align:center;
 font-weight:bold;
}
#table {
  padding: 20;
  margin: auto;
}
body{
  font-family: sans-serif;
  background-image:url("images/thumb.jpg");
  background-repeat:no-repeat;
  background-size: cover;
  margin: 0;
  padding: 0;
}
</style>
</head>
<body>
 <div>
    <jsp:include page="pagedesign/navbar.jsp" flush="false" />
  </div>

<caption><b><p id="title">&nbsp회원정보수정</p></b></caption><br/><br/>
<form action="process/passModifyProcess.jsp" method = "post">
<table width=80% border =1 id="table">
<tr>
<td>비밀번호:&nbsp<input type="password" size=30 name="modiPass" ></td>
<td>비밀번호&nbsp확인:&nbsp<input type="password" size = 30 name="passCon" ></td>
</tr>
<tr>
<td colspan=2 align=center><input type="submit" value="완료"></td>
</tr>
</table>
</form>
