﻿<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head><title>home</title>
<style>
body {font-family: Arial, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

.container {
  padding: 30px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

span.psw {
  display: block;
  float: none;
  font-size: 20px;
}
</style>
</head>
<body>
<h2>Registration</h2>
<form action="process/registerProcess.jsp" method="post">
  <div class="imgcontainer">
  </div>
  <div class="container">
    <label><b>Username</b></label>
    <input type="text" name="id" required>

    <label><b>Name</b></label>
    <input type="text" name="name" required>

    <label><b>Password</b></label>
    <input type="password" name="pass" required>

    <label><b>Re-type Password</b></label>
    <input type="password" name="pass2" required>

    <button type="submit">Register</button>
  </div>
</form>

</body>
</html>
