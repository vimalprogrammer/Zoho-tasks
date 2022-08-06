<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style type="text/css">
.bus {
  text-align: center;
  border: 3px solid green;
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
    response.sendRedirect("../admin.jsp");
}
%>
    <div class='bus'>
    <br><br><center> View Bus<br><br><br>
    </div> <br><br>
    <center>
	<form action="view_single_bus.jsp" method="post">
	    Bus Number :<input type="text" name="bus_no">
	<input type="submit" ><br><br>
	<a href="view_all_bus.jsp">View All Buses</a><br>
	<br>
	<a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a><br><br>
<p>${message}</p>

</body>
	<br><br><br>
	</center>
</body>
</html> 
