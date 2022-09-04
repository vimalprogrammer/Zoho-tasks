<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Vimal Travels</title>
    <style>
    .reg {
      text-align: center;
      border: 3px solid green;
      background-color: lightblue;
    }
    </style>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      body {
      align-content: center;
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
    //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 

    out.println("<div style='position: absolute; top: 0; right: 1; width: 100px; text-align:right;'><br><br><br><br><br><br><br>");
    out.println("<a href='../logout_admin.jsp' style='font-size:20px;'>Logout</a><br>");
    out.println("</div>");

// response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
// response.setHeader("Pragma", "no-cache"); 
response.setDateHeader("Expires", 0);

if(session.getAttribute("userid")==null)
{
    response.sendRedirect("../index.html");
}
%>

    <div class="reg"><center><br><h3>Register Bus Here</h3><br></center></div>
    <br>
    <br>
   <form method="get" action="add_bus2.jsp">
    <center>
      <div class="formcontainer">
      <hr/>
      <div class="container">
        <table border="1" width="30%" cellpadding="3" align="center">
            <thead>
                <tr>
                    <th colspan="2" align ="left">Register Bus Here</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Enter Bus Number</td>
                    <td><input type="text" name="bus_number" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter Bus Name</td>
                    <td><input type="text" name="bus_name" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter number of seats</td>
                    <td><input type="text" name="seats" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter Sleeper(y/n)</td>
                    <td><input type="text" name="sleeper" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter departure place</td>
                    <td><input type="text" name="dep" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter destination place</td>
                    <td><input type="text" name="des" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter Price </td>
                    <td><input type="text" name="price" value="" required/></td>
                </tr>
                <tr>
                  <td><button type="submit">Add</button></td>
                  <div class="container" style="background-color: #eee">
                    <label style="padding-left: 15px">
                    </label>
                    <td><button type="reset" value="Reset">Reset</button></td>
                </tr>
            </div>
            </tbody>
        </table>
        <p>${message}</p>
        </center>
    </form>
    <br>
<center><a href="#" style="color: black;" onclick="javascript:window.history.back(-1);return false;">Back</a></center></body>
</body>