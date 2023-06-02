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
<form action="process/product_reg_process.jsp" method="post" enctype="multipart/form-data">
<table width=80% border =1 id="table">
<tr>
<td colspan=2>종류:&nbsp노트북<input type="radio" name="category" value="laptop" checked>
 &nbsp데스크탑<input type="radio" name="category" value="desktop"> </td>
</tr>
<tr>
<td colspan=2>모델명:&nbsp<input type="text" name="model" size=70></td>
</tr>
<tr>
<td>CPU:&nbspi7-9700k<input type="radio" name="CPU" value="Intel i7-9700k" checked>&nbsp&nbsp
i5-9400f<input type="radio" name="CPU" value="Intel i5-9400f">&nbsp&nbsp
i3-9100f<input type="radio" name="CPU" value="Intel i3-9100f"></td>

<td>GPU:&nbspRTX-2080Ti<input type="radio" name="GPU" value="RTX-2080Ti" checked>&nbsp&nbsp
RTX-2060<input type="radio" name="GPU" value="RTX-2060">&nbsp&nbsp
GTX-1660Ti<input type="radio" name="GPU" value="GTX-1660Ti"></td>
</tr>
<tr>
<td>RAM:&nbsp32GB<input type="radio" name="RAM" value="32GB" checked>&nbsp&nbsp
16GB<input type="radio" name="RAM" value="16GB">&nbsp&nbsp
8GB<input type="radio" name="RAM" value="8GB">&nbsp&nbsp
4GB<input type="radio" name="RAM" value="4GB"></td>

<td>HDD:&nbsp2TB<input type="radio" name="HDD" value="2TB" checked>&nbsp&nbsp
1TB<input type="radio" name="HDD" value="1TB">&nbsp&nbsp
512GB<input type="radio" name="HDD" value="512GB">&nbsp&nbsp
256GB<input type="radio" name="HDD" value="256GB"></td>
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


 