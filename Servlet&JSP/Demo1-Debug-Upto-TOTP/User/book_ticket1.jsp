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
</head>
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

<body>

<%

//     out.println("<div style='position: absolute; top: 0; right: 1; width: 100px; text-align:right;'><br><br><br><br><br><br><br>");
//     out.println("<a href='../logout_user.jsp' style='font-size:20px;'>Logout</a><br>");
//     out.println("</div>");

// response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
// response.setHeader("Pragma", "no-cache"); 
// response.setDateHeader("Expires", 0);

//response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 

out.println("<div style='position: absolute; top: 0; right: 1; width: 100px; text-align:right;'><br><br><br><br><br><br><br>");
out.println("<a href='../logout_user.jsp' style='font-size:20px;'>Logout</a><br>");
out.println("</div>");

if(session.getAttribute("userid")==null)
{
    response.sendRedirect("../index.html");
}

%>


	<br>
	<div class="view"><br><br>DP & DS<br><br><br></div>
	<br><br><br>
	<div class="formcontainer">
	<hr/>
	<div class="container">
	<form action="avail_ticket.jsp" method="get">
	Departure Place:<input type="text" name="dep"/><br><br>
	Destination Place:<input type="text" name="des"/><br><br>
	<button type="submit">Submit</button>	
	</form>
	<br><br>
</div>
</div>
<center><p>${message}</p>
	<br><br>
	<a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a>
	</center>
</body>
</html> 