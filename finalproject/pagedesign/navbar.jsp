<%@ page contentType="text/html;charset=utf-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<style>
nav{
  width: 100%;
  height: 60px;
  background-color: #fff;
}
nav ul{
float: left;
  }
nav ul li{
  float: left;
  list-style: none;
  position: relative;
  width: 120px;
  margin: -10px 0 0 0;
  text-align: center;
  }
  nav ul li:hover{
    background-color:#EE8774;
    }
nav ul li a{
    text-decoration: none;
    display: block;
    font-size: 15px;
    color: black;
    padding: 15px 0 15px 0;
  }
nav ul li ul {
    display: none;
    position: absolute;
    background-color: white;
    padding: 11px 0 0 0;
    margin: 0 0 0 0;
    border-radius: 0px 0px 4px 4px;
  }
  nav ul li:hover ul {
      display: block;
    }
  nav ul li ul li{
    width: 180px;
    text-align: center;
    border-radius: 4px;

  }
  nav ul li ul li a{
    padding: 16px 16px;

  }
nav ul li ul li a:hover{
    background-color: #EE8774;
  }
  .logo{
    font-size: 40px;
    font-weight: bold;
    float: left;
    margin: 0 0 0 0;
    padding: 0 50px 0 0;
    line-height: 30px;

  }
  .login{
    float: right;
    padding: 10px 0 0 650px;
  }
  .login a{
    text-decoration: none;
    color: black;
  }

#login {
    width: 250px;
    height: 20px;
    padding: 16px 10px;
    right: -520px;
}
</style>
<%
	String loginID = (String)session.getAttribute("loginID");
	String loginName = (String)session.getAttribute("loginName");
	String loginIsAdmin = (String)session.getAttribute("loginIsAdmin");
%>

    <nav>
      <ul>
        <p class="logo">EJ</p>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="#products">Products</a>
          <ul>
            <li><a href="computer.jsp">Computer</a></li>
            <li><a href="accessories.jsp">Accessories</a></li>
          </ul>
        </li>
        <li><a href="#community">Community</a>
        <ul>
          <li><a href="forum_list.jsp">Forum</a></li>
        </ul>
        </li>
        
        
<%   
         if(loginID == null){
%>
<div class="login"><a href="login.html">Login</a></div>
<%
        } else if(loginIsAdmin.equals("O")) {
%>
 <li id="login">
  환영합니다!&nbsp관리자&nbsp<b><%=loginName%></b>님!
  <ul>
  <li><a href="process/logoutProcess.jsp">로그아웃</a></li>
  <li><a href="memberData.jsp">회원 정보</a></li>
  </ul>
</li>
<%
        } else {
%>
 <li id="login">
 환영합니다!&nbsp<b><%=loginName%></b>님!
<ul>
  <li><a href="process/logoutProcess.jsp">로그아웃</a></li>
  <li><a href="memberData.jsp">회원 정보</a></li>
</ul>
</li>
<%
        }
%>
     
      </ul>
    </nav>
