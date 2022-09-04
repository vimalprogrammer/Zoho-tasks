<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vimal Travels</title>
<style>
.view {
  text-align: center;
  border: 3px solid green;
  background-color: lightblue;

}

  input[type=submit] {
  padding: 6px 11px;
  margin: 6px 0;
  box-sizing: border-box;
}

</style>
<style>
  body {
  justify-content: center;
  font-family: Roboto, Arial, sans-serif;
  font-size: 15px;
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
    response.sendRedirect("../index.html");
}

%>

<%
try
{

 //============================================================= 

 String departure=String.valueOf(session.getAttribute("departure"));
 String destination=String.valueOf(session.getAttribute("destination"));
 //=============================================================

session.setAttribute("departure",departure);
session.setAttribute("destination",destination);

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
ResultSet rs1 = stmt1.executeQuery( "SELECT * FROM "+s+" order by id asc;" );

int cnt=0;
out.println("<form action='booked.jsp' ><table border='1'><tr>");
String price = (String)request.getParameter("price");
session.setAttribute("price",price);
while (rs1.next()) 
{
     String seats = rs1.getString("seat_no");
     if(seats.contains("B"))
        out.println("<td><input type=\"submit\" name=\"seats\" value="+seats+" style=\"pointer-events: none;color:#FF3333;\" /></td>");
    else
        out.println("<td><input type=\"submit\" name=\"seats\" value="+seats+" style='color:#169E1A;' /></td>");

     //out.println(seats);
    ++cnt;
    if(cnt==30)
        out.println("<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>");
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

<svg width="170" height="70">
  <rect x="50" y="20" width="40" height="40" style="fill:#175806;stroke:#175806;stroke-width:5;fill-opacity:0.5;stroke-opacity:0.9" />
</svg>

    <svg width="130" height="70">
  <rect x="50" y="20" width="40" height="40" style="fill:#E33C13;stroke:#E33C13;stroke-width:5;fill-opacity:0.5;stroke-opacity:0.9" />
</svg>
<br>
<center><p>${message}</p></center>
<center>Available &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Booked</center><br><br>
<center><a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a></center></body>
</html>


