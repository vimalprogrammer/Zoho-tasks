<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add_bus_jsp</title>
<style>
.view {
  text-align: center;
  border: 3px solid green;
  background-color: lightblue;

}
</style>
</head>
<body>
<div class="view"><br><br>Ticket Booking<br><br><br></div>
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
    response.sendRedirect("../login1.jsp");
}

%>


<%
try
{

 //============================================================= 

 String departure=String.valueOf(session.getAttribute("dep1"));
 String destination=String.valueOf(session.getAttribute("des1"));
 //=============================================================

 String bus_no1 = request.getParameter("bus_no");
 session.setAttribute("bn",bus_no1);

String bus_no=(String)session.getAttribute("bn");  
String seat=String.valueOf(session.getAttribute("seat"));

if(bus_no.equals(""))
{
        String message = "Field can't be empty";
    request.setAttribute("message", message);
    request.getRequestDispatcher("avail_ticket.jsp").forward(request, response);
}

 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 c.setAutoCommit(false);

 Statement stmt = c.createStatement();

 String s="b"+bus_no;

 //out.println("<br><br>"+s+"<br><br>");

 session.setAttribute("bus", s);

 ResultSet rs = stmt.executeQuery( "SELECT * FROM bus_details where departure='"+departure+"' and destination='"+destination+"'");


int flag=0;
 while(rs.next())
 {
    //debugging purpose
     String bus_no_check = rs.getString("bus_id");
     if(bus_no_check.equals(bus_no1))
     {
        // out.println(rs.getString("bus_id")+" ");
        // out.println("while innnnnnnnnnnnnnnnnnn ");
        flag=1;
        // out.println("flag "+flag);
        stmt.close();
        c.commit();
        c.close();
        break;
     }
 } 
if(flag==1)
{
  Class.forName("org.postgresql.Driver").newInstance();
// out.println("flag in");
 Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 con.setAutoCommit(false);

 Statement stmt1 = con.createStatement();

out.println("<center>");
String str=s;
// out.println(s+" ");
ResultSet rs1 = stmt1.executeQuery( "SELECT * FROM "+s+"; " );

int cnt=0;
out.println("<form action='booked.jsp' ><table border='1'><tr>");
while (rs1.next()) 
{
     String seats = rs1.getString("seat_no");
     out.println("<td><input type=\"submit\" name=\"seats\" value="+seats+" /></td>");

     //out.println(seats);
    ++cnt;
    if(cnt%10==0)
        out.println("</tr></br>");
}
out.println("</table></form>");
stmt.close();
con.commit();
con.close();
out.println("<center>");
}
else
{
    String message = "Please choose the available bus list";
    request.setAttribute("message", message);
    request.getRequestDispatcher("avail_ticket.jsp").forward(request, response);    
    stmt.close();
    c.commit();
    c.close();
}
}
catch(Exception e){
}
%>

<center><p>B - Booked Seats</p></center>
<br>
<br>
<center><p>${message}</p></center>
<br>
<center><a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a></center></body>
</html>


