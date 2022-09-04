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
/*      span.psw {
      float: right;
      padding-top: 0;
      padding-right: 15px;
      }*/
      /* Change styles for span on extra small screens */
/*      @media screen and (max-width: 100px) {
      span.psw {
      display: block;
      float: none;
      }*/
    </style>
</head>
<body>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<!--     <div class="user"><center><h3><br>User Registration<br><br></h3></center></div>
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
</body> -->


  <body>
    <br><br>
   <form method="post" action="register.jsp">
      <h1>User Register</h1>
      <div class="formcontainer">
      <hr/>
      <div class="container">
        <label for="fname"><strong>First Name</strong></label><br>
        <input type="text" placeholder="Enter first name" name="fname" required><br><br>
        <label for="lname"><strong>Last Name</strong></label><br>
        <input type="text" placeholder="Enter last name" name="lname" required><br><br>
        <label for="email"><strong>Mail</strong></label><br>
        <input type="email" placeholder="Enter email" name="email" required><br><br>
        <label for="ph"><strong>Phone</strong></label><br>
        <input type="text" placeholder="Enter Phone" name="ph" required><br><br>
        <label for="gender"><strong>Gender</strong></label><br>
        <input type="radio" name="gender" value="Male" required/>Male
        <input type="radio" name="gender" value="Female" />Female
<!--         <input type="text" placeholder="Enter gender" name="gender" required><br><br>--><br><br>        
        <label for="psw"><strong>Password</strong></label><br>
        <input type="password" placeholder="Enter Password" name="pwd" required><br>
      </div>
      <button type="submit">Register</button>
      <div class="container" style="background-color: #eee">
        <label style="padding-left: 15px">
        </label>
      </div>
    </form>
    <p>${message}</p>
  </body>
</html>
