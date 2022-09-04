<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
.view {
  text-align: center;
  border: 3px solid green;
   background-color: lightblue;
}
</style>

<style>
	body {
	justify-content: center;
	font-family: Roboto, Arial, sans-serif;
	font-size: 15px;
	}
</style>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      body {
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
    </style>

</head>
<body>

<%
    //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 

    out.println("<div style='position: absolute; top: 0; right: 1; width: 100px; text-align:right;'><br><br><br><br><br><br><br>");
    out.println("<a href='../logout_admin.jsp' style='font-size:20px;'>Logout</a><br>");
    out.println("</div>");
// response.setHeader("Pragma", "no-cache"); 
// response.setDateHeader("Expires", 0);

if(session.getAttribute("userid")==null)
{
    response.sendRedirect("../index.html");
}
%>

    <div class="view"><center><br><h3>Delete Bus</h3><br></center></div>
	<br>
	<center><br><br><br>
	<div class="formcontainer">
	<hr/>
	<div class="container">
	<form action="delete_bus2.jsp" method="get">
	Enter Bus number to delete:<input type="text" name="bus_no" required/>
	<button type="submit">Submit</button>	
	</form>
	<p>${message}</p>
<br><br>
<center><a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a></body></center>
</center>
</body>
</html> 