<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
.view {
  text-align: center;
  border: 3px solid green;
}
</style>
</head>
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
    response.sendRedirect("../login1.jsp");
}



%>


	<br>
	<div class="view"><br><br>DP & DS<br><br><br></div>
	<br><br><br>
	<center>
	<form action="avail_ticket.jsp" method="post">
	Departure Place:<input type="text" name="dep"/><br><br>
	Destination Place:<input type="text" name="des"/><br><br>
	<input type="submit" >	
	</form>
	<br><br>
<center><p>${message}</p>
	<br><br>
	<a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a>
	</center>
</body>
</html> 