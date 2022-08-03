<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin_jsp</title>
<style>
.bus {
  text-align: center;
  border: 3px solid green;
}
.bus1 {
  text-align: center;
}
</style>

</head>
<body>
    <div>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %> 

<%
 String userid = request.getParameter("usr");
 String pwd = request.getParameter("pwd");

 if(userid.equals("") || pwd.equals(""))
 {
// String message = "Fields can't be empty!";
// response.sendRedirect("admin.jsp?message=" + URLEncoder.encode(message, "UTF-8")); }
String message = "Fields can't be empty!";
request.setAttribute("message", message);
request.getRequestDispatcher("/admin.jsp").forward(request, response);
}

else
{
 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 //c.setAutoCommit(false);
 Statement stmt = c.createStatement();
 ResultSet rs = stmt.executeQuery( "SELECT * FROM admin_details where admin_name='"+userid+"'");

if(rs.next())
{

if(rs.getString(3).equals(pwd))
{
    out.println("<div class='bus'>");
    out.println("<br><br><center> Admin Page <br><br><br>");
    out.println("</div>"); 

    out.println("<div class='bus1'>");

    out.println("<br><br><br>");
    out.println("<a href='Bus/add_bus1.jsp' style='font-size:20px;'>Add bus</a><br>");        
    out.println("<a href='Bus/view_bus.jsp' style='font-size:20px;' >View Bus</a><br>");
    out.println("<a href='Bus/edit_bus1.jsp' style='font-size:20px;'>Edit Bus</a><br>");
    out.println("<a href='Bus/delete_bus1.jsp' style='font-size:20px;'>Delete Bus</a><br>");
    out.println("<a href='index.html' style='font-size:20px;'>Logout</a><br>");
    out.println("<a href='admin_register.jsp' style='font-size:20px;'>Admin Register</a><br>");
    out.println("<br><br><br>");
    out.println("</div>");  
}  
}
else
{
    String message = "Invalid credientials!";
    request.setAttribute("message", message);
    request.getRequestDispatcher("/admin.jsp").forward(request, response);
    stmt.close();
    c.close();
}
}
%>

<!-- <br><br><br>
<a href="Bus/add_bus.html">Add bus</a><br>        
<a href="Bus/view_bus.html">View Bus</a><br>
<a href="Bus/edit_bus.html">Edit Bus</a><br>
<a href="Bus/delete_bus.html">Delete Bus</a><br>
<a href="index.html">Logout</a><br>
<br><br><br> -->

<br><br>
<center><a href="index.html">Home</a><br></center><br>
<center><a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a></center>

</body>

</body>
</html>