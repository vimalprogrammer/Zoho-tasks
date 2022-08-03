<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Regjsp</title>
<style type="text/css">
.bus {
  text-align: center;
  border: 3px solid green;
}
</style>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %>

<%
out.println("<div class='bus'><br><br><center> Admin Register <br><br><br></div>");
out.println("<br><br><br>");
out.println("<form method=\"post\" action=\"admin_db.jsp\">");
out.println("<center>");
out.println("<table border=\"1\" width=\"30%\" cellpadding=\"3\">");
out.println("<thead>");
out.println("<tr>");
out.println("<th colspan=\"2\" align =\"left\">Add Admin Here</th>");
out.println("</tr>");
out.println("</thead>");
out.println("<tbody>");
out.println("<tr>");
out.println("<td>User Name</td>");
out.println("<td><input type=\"text\" name=\"usr\" value=\"\" /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("<td>Password</td>");
out.println("<td><input type=\"password\" name=\"pwd\" value=\"\" /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("<td><input type=\"submit\" value=\"Submit\" /></td>");
out.println("<td><input type=\"reset\" value=\"Reset\" /></td>");
out.println("</tr>");
out.println("</tbody>");
out.println("</table>");
out.println("</center>");
out.println("</form>");
%>
<br>
<center><p>${message}</p></center>
<center><a href="#" style="color:black" onclick="javascript:window.history.back(-1);return false;">Back</a></center>
</body>
</body>
</html>