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

	<div class="view"><br><br>Delete Bus<br><br><br></div>
	<br>
	<center><br><br><br>
	<form action="delete_bus2.jsp" method="get">
	Enter Bus no want to delete:<input type="text" name="bus_no"/>
	<input type="submit" >	
	</form>
	<p>${message}</p>
<br><br>
<a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a></body>
</center>
</body>
</html> 