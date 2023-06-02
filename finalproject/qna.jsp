<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head><title>home</title>
<style>
body{
  font-family: sans-serif;
  background-color: #DC4A30;
  margin: 0;
  padding: 0;
}
.banner {
  width: 80%;
  height: 70%;
  top: 25%;
  left: 130px;
  position: absolute;
  color: #fff;
}
.banner-text{
  width: 50%;
  float:left;
}
.banner-text h1{
  font-size: 43px;
  width: 640px;
  position: relative;
  margin-left: 40px;
}
.banner-text p{
  font-size: 15px;
  width: 650px;
  position: relative;
  margin: 0 0 30px 40px;
}
.art {
  width: 50%;
  float: right;
}
.art img {
  width: 90%;

}
</style></head>
<body>
  <div>
    <jsp:include page="pagedesign/navbar.jsp" flush="false" />
  </div>
  <div class="banner">
    <div class="banner-text">
      <h1>Welcome To EJ!</h1>
      <p> Where we provide you the tech of your dreams. Our products
        are equipped with the latest technology capable of turning your wild
        imaginations into reality
      </p>
    </div>
    <div class="art">
      <img src="pagedesign/mario.png"/>
    </div>
  </div>
</body>
</html>
