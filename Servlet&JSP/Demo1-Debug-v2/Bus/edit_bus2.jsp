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

<%
try
{
 String bus_no = request.getParameter("bus_number");
 String bus_name = request.getParameter("bus_name");
 String seats = request.getParameter("seats");
 String sleeper = request.getParameter("sleeper");
 String dep = request.getParameter("dep");
 String des = request.getParameter("des");

  if(bus_no.equals("") || bus_name.equals("") || seats.equals("") || sleeper.equals("") || dep.equals("") || des.equals(""))
  {
    String message = "Fields can't be empty!";
    request.setAttribute("message", message);
    request.getRequestDispatcher("edit_bus1.jsp").forward(request, response);
  }

 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 c.setAutoCommit(false);


Statement stmt = c.createStatement();

 ResultSet rs = stmt.executeQuery( "SELECT * FROM bus_details where bus_id='"+bus_no+"'");
if(rs.next())
{

  String sql="delete from bus_details where bus_id = " + bus_no;  
  stmt.executeUpdate(sql);

  //out.println("Bus deleted successfully");

  String sql1 = "INSERT INTO Bus_Details (BUS_ID,BUS_NAME,TOTAL_SEATS,AC_or_NON_AC,DEPARTURE,DESTINATION)"
    + "VALUES ('"+bus_no+"','"+bus_name+"','"+seats+"','"+sleeper+"','"+dep+"','"+des+"');";

  stmt.executeUpdate(sql1);

  //out.println("<br>Bus Added successfully<br>");
  stmt.close();
  c.commit();
  c.close();

    String message = "Bus Edited Successfully!";
    request.setAttribute("message", message);
    request.getRequestDispatcher("edit_bus1.jsp").forward(request, response);

  }
else
{
    String message = "No bus with this number exists!";
    request.setAttribute("message", message);
    request.getRequestDispatcher("edit_bus1.jsp").forward(request, response);

}
}

catch(Exception e){
}

%>

<br>
<a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a>
</body>
</html>