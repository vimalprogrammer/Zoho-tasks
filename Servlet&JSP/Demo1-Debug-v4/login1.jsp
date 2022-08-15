<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Login</title>
    <style type="text/css">
    .login {
      text-align: center;
      border: 3px solid green;
      background-color: lightblue;

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
<!-- 
</head> -->
<body>

    <center><div class="login"><h2>User Login</h2></div></center>
    <br><br><br><br>
   <form method="post" action="login_user">
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
                    <td><input type="submit" value="Login" /></td>
                    <td><input type="reset" value="Reset" /></td>
                </tr>
                <tr>
                    <td colspan="2">Yet Not Registered!! <a href="Reg.jsp">Register Here</a></td>
                </tr>
            </tbody>
        </table>
    </form><br><br>
    <p>${message}</p>
        <center><a href="index.html">Back</a></body></center>
    <br><br>
</body>