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
try
{
 String bus_no = request.getParameter("bus_number");
//  session.setAttribute("bn",bus_no1);

// String bus_no=(String)session.getAttribute("bn");  
// String seat=String.valueOf(session.getAttribute("seat"));


 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 c.setAutoCommit(false);

 Statement stmt = c.createStatement();

 String s="b"+bus_no;

 //out.println("<br><br>"+s+"<br><br>");

 session.setAttribute("bus", s);
//out.println("HEY HELLO");

//  String sql1="create table '"+s+"' " + " (id serial primary key,"+" seat_no int not null)";
// stmt.executeUpdate(sql1);
// sql1="insert into '"+s+"' (seat_no) generate_series(1,'"+seats+"');";
// stmt.executeUpdate(sql1);
// insert into bus_seats (seat_no)
// select i
// from generate_series(1,50) i;
//         select * from bus_seats;"

// stmt.close();
// c.commit();
// c.close();
out.println("<center>");
String str=s;
ResultSet rs = stmt.executeQuery( "SELECT * FROM "+s+"; " );

int cnt=0;
out.println("<table border='1'><tr>");
while (rs.next()) 
{
     String seats = rs.getString("seat_no");
     out.println("<td>" + seats + "</td>");
    ++cnt;
    if(cnt%10==0)
        out.println("</tr></br>");
}
out.println("</table>");
stmt.close();
c.commit();
c.close();
out.println("<center>");
}
catch(Exception e){
}
%>
<br>
<br>
<form action="booked.jsp" method="post">
Choose Seat Number:<input type="text" name="sn"/>
<input type="submit" >  
</form>
<br>
<a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a></center></body>
</html>