<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin jsp</title>
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

</head>

</head>

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

    <br>
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
<!--        <p>Message: ${param.message}</p>-->
           <p>${message}</p>
        <br>
        </center>
        <center><a href="index.html">Back</a></body></center>
    </form>
</body>
