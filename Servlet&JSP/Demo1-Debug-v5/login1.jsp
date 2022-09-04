<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin jsp</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      html, body {
      display: flex;
      justify-content: center;
      font-family: Roboto, Arial, sans-serif;
      font-size: 15px;
      }
      form {
      border: 5px solid #f1f1f1;
      }
      input[type=text], input[type=password] {
      width: 100%;
      padding: 16px 8px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
      }
      button {
      background-color: #8ebf42;
      color: white;
      padding: 14px 0;
      margin: 10px 0;
      border: none;
      cursor: grabbing;
      width: 100%;
      }
      h1 {
      text-align:center;
      fone-size:18;
      }
      button:hover {
      opacity: 0.8;
      }
      .formcontainer {
      text-align: left;
      margin: 24px 50px 12px;
      }
      .container {
      padding: 16px 0;
      text-align:left;
      }
      span.psw {
      float: right;
      padding-top: 0;
      padding-right: 15px;
      }
      /* Change styles for span on extra small screens */
      @media screen and (max-width: 300px) {
      span.psw {
      display: block;
      float: none;
      }
    </style>
<!-- <script type="text/javascript">
      function preventBack() {
    // body...
    window.history.forward();
}

setTimeout("preventBack()",0);
window=function(){null};
</script> -->
<!-- <script type="text/javascript">
  history.pushState(null,null,location.href);
  window.onpopstate=function()
  {
    history.go(1);
  };
</script> -->
 </head>

<!-- <script type="text/javascript">
  history.pushState(null, null, window.location.href);
history.back();
window.onpopstate = () => history.forward();
</script> -->


<!-- <body>
    <br>
    <br><br><br>
    <center><h2>Admin Login</h2></center>
   <form method="post" action="admin_login.jsp">
        <center>
        <table border="1" width="30%" cellpadding="3">
            <thead>
                <tr>
                    <th colspan="2" align ="left">Login Here</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="usr" value="" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="pwd" value="" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Login"/></td>
                    <td><input type="reset" value="Reset"/></td>
                </tr>
            </tbody>
        </table>
        <br> -->
<!-- <!-         <p>Message: ${param.message}</p>
 --><!--            <p>${message}</p>
        <br>
        </center>
    </form>
</body> -->


<body>

<%
  response.setHeader ("Clear-Site-Data", "\"cache\"");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Expires","0");
  response.setDateHeader("Expires",-1);
%>

<!--     <br>
    <br><br><br>
    
    <center><h2>Admin Login</h2></center>
   <form method="post" action="login_admin">
        <center>
        <table border="1" width="30%" cellpadding="3">
            <thead>
                <tr>
                    <th colspan="2" align ="left">Login Here</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="usr" value="" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="pwd" value="" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Login"/></td>
                    <td><input type="reset" value="Reset"/></td>
                </tr>
            </tbody>
        </table>
        <br>
<!-       <p>Message: ${param.message}</p>-->
<!--            <p>${message}</p>
        <br>
        </center>
        <center><a href="index.html">Back</a></body></center>
    </form>
</body> -->
  <body>
    <br><br>
   <form method="post" action="login_user">
    <br><br><br>
      <h1>Login Form</h1>
      <div class="formcontainer">
      <hr/>
      <div class="container">
        <label for="uname"><strong>Username</strong></label><br>
        <input type="text" placeholder="Enter Username" name="usr" required>
        <label for="psw"><strong>Password</strong></label><br>
        <input type="password" placeholder="Enter Password" name="pwd" required>
      </div>
      <button type="submit">Login</button>
      <a href="Reg.jsp" style="color:black;">New User Register</a>
        </label>
      </div>
    </form>
  </body>
</html>