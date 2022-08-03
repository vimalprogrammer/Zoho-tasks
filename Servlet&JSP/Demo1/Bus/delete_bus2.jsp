<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view_bus_jsp</title>


</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %>


<%
try
{

 String bus_no = request.getParameter("bus_no");
 out.println(bus_no+"<br>");
 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 c.setAutoCommit(false);

  if(bus_no.equals(""))
  {
    String message = "Please enter a valid number!";
    request.setAttribute("message", message);
    request.getRequestDispatcher("delete_bus1.jsp").forward(request, response);
  }

Statement stmt = c.createStatement();

String sql="delete from bus_details where bus_id = " + bus_no;  
stmt.executeUpdate(sql);

String message = "Bus Deleted Successfully!";
request.setAttribute("message", message);
request.getRequestDispatcher("delete_bus1.jsp").forward(request, response);

stmt.close();
c.commit();
c.close();

}

catch(Exception e){
}

%>

<br>
<a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a></body>
</html>