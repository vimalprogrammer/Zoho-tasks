<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>User Register</title>
    <style>
    .user {
      text-align: center;
      border: 3px solid green;
      background-color: lightblue;

    }
    </style>
</head>
<body>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
    <div class="user"><center><h3><br>User Registration<br><br></h3></center></div>
    <br><br>
   <form method="post" action="register.jsp">
        <center>
        <table border="1" width="30%" cellpadding="3">
            <thead>
                <tr>
                    <th colspan="2" align ="left">Register Here</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>First Name</td>
                    <td><input type="text" name="fname" value="" /></td>
                </tr>
                <tr>
                    <td>Last name</td>
                    <td><input type="text" name="lname" value="" /></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" value="" /></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" name="ph" value="" /></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><input type="text" name="gender" value="" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="pwd" value="" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Register" /></td>
                    <td><input type="reset" value="Reset" /></td>
                </tr>
                <tr>
                </tr>
            </tbody>
        </table>
        <p>${message}</p>
        </center>
    </form>
<center><a href="login1.jsp" style="color:black"; >Back</a></center></body>
</body>