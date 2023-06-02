<%@ page contentType="text/html;charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>

<html>
<head>
<style>
body{
  font-family: sans-serif;
  background-color: #EEFFFF;
  margin: 0;
  padding: 0;
}

#table {
  padding: 20;
  margin: auto;
}
#title {
  text-align: left;
  color: green;
  font-size: 64px;
}
.attri{
  text-align:center;
}
</style>
</head>
<body>
<div>
    <jsp:include page="pagedesign/navbar.jsp" flush="false" />
</div>
<caption><b><p id="title">&nbsp글쓰기</p></b></caption><br/><br/>
<form action="process/fwriteProcess.jsp" method="post">
<table id="table" frame=below width=70%>
<tr>
<td class="attri"><b>제목: </b><input type="text" size=103 name="FWtitle"></td>
</tr>
<tr>
<td class="attri"><textarea rows=20 cols=100 wrap=physical name="FWbody"></textarea></td>
</tr>
<tr>
<td class="attri"><input type=submit value="등록"></td>
</tr>
</table>
</body>
</html>