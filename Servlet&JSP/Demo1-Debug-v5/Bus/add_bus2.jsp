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

<div class="view"><br><br>Bus database<br><br><br></div>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%

    //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 

    out.println("<div style='position: absolute; top: 0; right: 1; width: 100px; text-align:right;'><br><br><br><br><br><br><br>");
    out.println("<a href='../logout_admin.jsp' style='font-size:20px;'>Logout</a><br>");
    out.println("</div>");

// response.setHeader("Pragma", "no-cache"); 
// response.setDateHeader("Expires", 0);
  
if(session.getAttribute("userid")==null)
{
    response.sendRedirect("../index.html");
}
%>

<%
boolean flag=true;//check if bus already exists

try
{

 String bus_no = request.getParameter("bus_number");
 String bus_name = request.getParameter("bus_name");
 String seats = request.getParameter("seats");
 String sleeper = request.getParameter("sleeper");
 String dep = request.getParameter("dep");
 String des = request.getParameter("des");
 String price = request.getParameter("price");

 // out.println(bus_no+"<br>");
 // out.println(bus_name+"<br>");
 // out.println(seats+"<br>");
 // out.println(sleeper+"<br>");
 // out.println(dep+"<br>");
 // out.println(des+"<br>");

  if(bus_no.equals("") || bus_name.equals("") || seats.equals("") || sleeper.equals("") || dep.equals("") || des.equals("") || price.equals(""))
  {
    String message = "Fields can't be empty!";
    request.setAttribute("message", message);
    request.getRequestDispatcher("/Bus/add_bus1.jsp").forward(request, response);
  }


   Class.forName("org.postgresql.Driver").newInstance();
   Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
   c.setAutoCommit(false);
    //out.println("Opened ~~database~~ successfully");


  Statement stmt = c.createStatement();

 ResultSet rs = stmt.executeQuery( "SELECT * FROM bus_details where bus_id='"+bus_no+"'");
if(rs.next())
{
    flag=false;
    String message = "Bus with this number already xists!";
    request.setAttribute("message", message);
    request.getRequestDispatcher("add_bus1.jsp").forward(request, response);
    stmt.close();
    c.commit();
    c.close();
}

else
{
  String sql = "INSERT INTO Bus_Details (BUS_ID,BUS_NAME,TOTAL_SEATS,AC_or_NON_AC,DEPARTURE,DESTINATION, PRICE) "
    + "VALUES ('"+bus_no+"','"+bus_name+"','"+seats+"','"+sleeper+"','"+dep+"','"+des+"','"+price+"');";

  stmt.executeUpdate(sql);

  stmt.close();
  c.commit();
  c.close();

  }
}
  catch(Exception e){
  }

out.println("<center>");
out.println("<table border=\"1\" cellpadding=\"5\" width=\"500\">");
out.println("<tr>");
out.println("<th>");
out.println("Bus_ID");
out.println("</th>");
out.println("<th>");
out.println("Bus_Name");
out.println("</th>");
out.println("<th>");
out.println("Total_Seats");
out.println("</th>");
out.println("<th>");
out.println("sleeper(y/n)");
out.println("</th>");
out.println("<th>");
out.println("Departure");
out.println("</th>");
out.println("<th>");
out.println("Destination");
out.println("</th>");
out.println("<th>");
out.println("Price");
out.println("</th>");
out.println("</tr>");

try
{
 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 c.setAutoCommit(false);

Statement stmt = c.createStatement();
ResultSet rs = stmt.executeQuery( "SELECT * FROM bus_details;" );

int bus_no=0;
String seats="";
while (rs.next()) 
{
     bus_no = rs.getInt("bus_id");
     String bus_name = rs.getString("bus_name");
     seats = rs.getString("total_seats");
     String sleeper = rs.getString("ac_or_non_ac");
     String dep = rs.getString("departure");
     String des = rs.getString("destination");
     String price=rs.getString("price");

    out.println("<tr><td>" + bus_no + "</td><td>" + bus_name + "</td><td>" + seats + "</td><td>" + sleeper + "</td><td>" + dep + "</td><td>" + des+"</td><td>"+price+"</td></tr>");
}
stmt.close();
c.commit();
c.close();

}

catch(Exception e){
}

if(flag)
{
try
{   
 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 c.setAutoCommit(false);

Statement stmt = c.createStatement();

 String bus_no = request.getParameter("bus_number");
 String seats = request.getParameter("seats");

String s="b"+bus_no;
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
String sql1="create table "+s+" (id serial primary key,"+" seat_no text not null)";
stmt.executeUpdate(sql1);
// String sql2="insert into "+s+" (seat_no) generate_series(1,'"+seats+"');";
// out.println("<br>HEY HELLO");
// stmt.executeUpdate(sql2);
stmt.close();
c.commit();
c.close();

}
catch(Exception e){
}
}

 
if(flag)
{
try
{
 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 c.setAutoCommit(false);

Statement stmt = c.createStatement();

 String bus_no = request.getParameter("bus_number");
 String seats = request.getParameter("seats");

String s="b"+bus_no;
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

String sql2="insert into "+s+" (seat_no) select i from generate_series(1,'"+seats+"') i";
stmt.executeUpdate(sql2);
stmt.close();
c.commit();
c.close();
}
catch(Exception e){
}
}
%>

<br>
</table><br><br>
<a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a></center></body>
</html>