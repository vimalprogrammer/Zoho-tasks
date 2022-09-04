<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add_bus_jsp</title>

<style>
  body {
  justify-content: center;
  font-family: Roboto, Arial, sans-serif;
  font-size: 15px;
  }
</style>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>

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


<%
try
{

 String seat1=(String)request.getParameter("seats");

 //out.println(seat1);
 session.setAttribute("seat",seat1);
 String seat=String.valueOf(session.getAttribute("seat"));

 if(seat.equals(""))
{
        String message = "Field can't be empty";
    request.setAttribute("message", message);
    request.getRequestDispatcher("book_tkt.jsp").forward(request, response);
}

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

session.setAttribute("temp",temp);
session.setAttribute("seat",seat);

String sql1="select * from "+bus_no+" where seat_no='"+seat+"' ";
ResultSet rs=stmt.executeQuery(sql1);

// String bus_no=(String)session.getAttribute("bn");  


if(rs.next())
{
    String message = "Sorry, this seat number booked already! Please enter your departure and destination again to continue..";
    request.setAttribute("message", message);
    request.getRequestDispatcher("book_ticket1.jsp").forward(request, response);
}

else
{

 ResultSet rs1 = stmt.executeQuery( "SELECT * FROM bus_details where bus_name='"+bus_no+"'");
 rs1.next();
 String price=rs1.getString("price");


 String user=(String)session.getAttribute("userid");
 ResultSet rs2 = stmt.executeQuery( "SELECT * FROM user_details where first_name='"+user+"'");

 if(rs2.next())
 {
    //out.println("AvailTKt in");
    //debugging purpose
     String fname = rs2.getString("first_name");
     String mail = rs2.getString("email");
     String phone = rs2.getString("phone");
     String gender = rs2.getString("gender");

    //out.println(price);

out.println("<center><br><br><br>");
out.println("Confirm Ticket");    
out.println("<br><br>");
out.println("<form method=\"get\" action=\"db_tkt.jsp\">");
out.println("<table border=\"1\" width=\"30%\" cellpadding=\"3\">");
out.println("<thead>");
out.println("<tr>");
out.println("<th colspan=\"2\" align =\"left\">Register Bus Here</th>");
out.println("</tr>");
out.println("</thead>");
out.println("<tbody>");
out.println("<tr>");
out.println("<td>Enter Name</td>");
out.println("<td><input type=\"text\" name=\"name\" value='"+fname+"' readonly /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("<td>Enter mail</td>");
out.println("<td><input type=\"text\" name=\"mail\" value='"+mail+"' readonly /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("<td>Enter phone number</td>");
out.println("<td><input type=\"text\" name=\"phone\" value='"+phone+"' readonly /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("<td>Enter gender</td>");
out.println("<td><input type=\"text\" name=\"gender\" value='"+gender+"' readonly /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("<td>Ticket_no</td>");
out.println("<td><input type=\"text\" name=\"ticket_no\" value='"+temp+"' readonly /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("<td>Bus_no</td>");
out.println("<td><input type=\"text\" name=\"bus_no\" value='"+bus_no+"' readonly /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("<td>Price</td>");
out.println("<td><input type=\"text\" name=\"price\" value='"+price+"' readonly /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("<td><input type=\"submit\" value=\"Book\" /></td>");
out.println("<td><input type=\"reset\" value=\"Reset\" /></td>");
out.println("</tr>");
out.println("<tr>");
out.println("</tr>");
out.println("</tbody>");
out.println("</table>");
out.println("</center>");
out.println("</form>");

// String sql = "Update "+bus_no+" set seat_no='"+seat+"' where id='"+temp+"'; ";
//stmt.executeUpdate(sql);
stmt.close();
c.commit();
c.close();
}
}
}
catch(Exception e){
}
%>
<br>
<br>
<center><p>${message}</p></center>
<br>
<center><a href="../login2.jsp" onclick="javascript:window.history.back(2);return false;">back</a></center></body>
</html>
