<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add_bus_jsp</title>


</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>

<%
try
{

 String seat=request.getParameter("sn");

 // session.setAttribute("seat",seat1);
 // String seat=String.valueOf(session.getAttribute("seat"));

 String bus_no=String.valueOf(session.getAttribute("bus"));
 // out.println(bus_no);
//I know we can directly pass the desired bno 

 // int type=Integer.valueOf(seat);
 // if(StringUtils.isNumeric(type) == false)
 // {
 //  out.println("Invalid Seat Number ");//Need to be corrected
 // }

 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 c.setAutoCommit(false);

Statement stmt = c.createStatement();
String temp=seat;
seat="B"+seat;

String sql1="select * from "+bus_no+" where seat_no='"+seat+"' ";
ResultSet rs=stmt.executeQuery(sql1);

if(rs.next())
{
    String message = "Sorry, this seat number booked already!";
    request.setAttribute("message", message);
    request.getRequestDispatcher("book_ticket1.jsp").forward(request, response);
}

else
{
out.println("<center><br><br><br>");
out.println("Enter your details to Re-confirm your tickets");    
out.println("<br><br>");
out.println("<form method=\"post\" action=\"db_tkt.jsp\">");
out.println("<table border=\"1\" width=\"30%\" cellpadding=\"3\">");
out.println("<thead>");
out.println("<tr>");
out.println("<th colspan=\"2\" align =\"left\">Register Bus Here</th>");
out.println("</tr>");
out.println("</thead>");
out.println("<tbody>");
out.println("<tr>");
out.println("<td>Enter Name</td>");
out.println("<td><input type=\"text\" name=\"name\" value=\"\" /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("<td>Enter mail</td>");
out.println("<td><input type=\"text\" name=\"mail\" value=\"\" /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("<td>Enter phone number</td>");
out.println("<td><input type=\"text\" name=\"phone\" value=\"\" /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("<td>Enter gender</td>");
out.println("<td><input type=\"text\" name=\"gender\" value=\"\" /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("<td>Enter ticket_no</td>");
out.println("<td><input type=\"text\" name=\"ticket_no\" value='"+temp+"' readonly /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("<td><input type=\"submit\" value=\"Add\" /></td>");
out.println("<td><input type=\"reset\" value=\"Reset\" /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("</tr>");
out.println("</tbody>");
out.println("</table>");
out.println("</center>");
out.println("</form>");

String sql = "Update "+bus_no+" set seat_no='"+seat+"' where id='"+temp+"'; ";
stmt.executeUpdate(sql);
stmt.close();
c.commit();
c.close();
}
}
catch(Exception e){
}
%>
<br>
<br>
<center><p>${message}</p>
<br>
<center><a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a></center></body>
</html>
