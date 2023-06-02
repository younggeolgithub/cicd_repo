<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
<style>
body{
  font-family: sans-serif;
  
  margin: 0;
  padding: 0;

}
#textSet {
  text-align: left;
  color: white;
  font-size: 48px;
}
#textSet2 {
  text-align: left;
  color: white;
  font-size: 32px;
}

.imageSet{
 width:100%;
 height:500px;
}
#layer1{
    background-image:url("images/msi.jpg");
    width:100%;
    height:700;
    background-size:cover;
    text-size:30;
}
#layer2{
    top:900;
    background-image:url("images/intel_i7.jpg");
    width:100%;
    height:900;
    background-size:cover;
    background-position: 50% 50%;
}


</style>
</head>
<body>
<div>
    <jsp:include page="pagedesign/navbar.jsp" flush="false" />
  </div>
<div id="layer1"><p id="textSet">하이엔드PC의 명가! EJ!</p><br/>
<p id="textSet2">고성능PC를 전문적으로 취급하는 저희 EJ는 차세대 기술과 공정을 이용하여 <br/>최고의 퍼포먼스를 고객들에게 제공하는 기업입니다.</p></div>
<div id="layer2"></div>
</body>
</html>