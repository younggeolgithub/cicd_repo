<%@ page contentType="text/html;charset=utf-8" %>

<html>
<head>
<style>
#title {
  text-align: left;
  color: white;
  font-size: 64px;
}
#table {
  padding: 20;
  margin: auto;
}
body{
  font-family: sans-serif;
  background-image:url("images/Fondo.png");
  margin: 0;
  padding: 0;
</style>
<body>
<div>
    <jsp:include page="pagedesign/navbar.jsp" flush="false" />
  </div>
<caption><b><p id="title">&nbsp물품등록</p></b></caption><br/><br/>
<form action="process/product_a_reg_process.jsp" method="post" enctype="multipart/form-data">
<table width=80% border =1 id="table">
<tr>
<td colspan=2>종류:&nbsp키보드<input type="radio" name="category" value="keyboard" checked>
 &nbsp헤드셋<input type="radio" name="category" value="headset">
 &nbsp마우스<input type="radio" name="category" value="mouse"> </td>
</tr>
<tr>
<td colspan=2>모델명:&nbsp<input type="text" name="model" size=70></td>
</tr>
<tr>
<td colspan=2>가격:&nbsp<input type="text" size=20 name="price" ></td>
</tr>
<tr>
<td align=center colspan=2>이미지:&nbsp<input type=file name="image"></td>
</tr>
<tr>
<td align=center colspan=2><input type=submit value="등록"></td>
</tr>
</table>
</form>
</body>
<html>


 