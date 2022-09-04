<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vimal Travels</title>

<style>
.bus {
  text-align: center;
  border: 3px solid green;
  background-color: lightblue;
}
</style>

   <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      body {
      justify-content: center;
      font-family: Roboto, Arial, sans-serif;
      font-size: 15px;
      }
      form {
      border: 5px solid #f1f1f1;
      }
      button {
      background-color: #8ebf42;
      color: white;
      padding: 14px 0;
      margin: 10px 0;
      border: none;
      cursor: grabbing;
      width: 100%;
      }
      h1 {
      text-align:center;
      fone-size:18;
      }
      button:hover {
      opacity: 0.8;
      }
      .formcontainer {
      text-align: left;
      margin: 24px 50px 12px;
      }
      .container {
      padding: 16px 0;
      text-align:left;
      }
/*      span.psw {
      float: right;
      padding-top: 0;
      padding-right: 15px;
      }*/
      /* Change styles for span on extra small screens */
/*      @media screen and (max-width: 100px) {
      span.psw {
      display: block;
      float: none;
      }*/
    </style>
</head>

<body>

<div class="bus"><br><br>View All Bus<br><br><br></div>
   
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
    response.sendRedirect("../index.html");
}
%>
<div class="formcontainer">
<div class="container">
<center>
<table border="1" cellpadding="5" width="500" align="center">
    <tr>
        <th>
            Bus_ID
        </th>
        <th>
            Bus_Name
        </th>
        <th>
            Total_Seats
        </th>
        <th>
            sleeper(y/n)
        </th>
        <th>
            Departure
        </th>
        <th>
            Destination
        </th>
        <th>
            Price
        </th>
    </tr>
<%
try
{
 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 c.setAutoCommit(false);

Statement stmt = c.createStatement();
ResultSet rs = stmt.executeQuery( "SELECT * FROM bus_details;" );

while (rs.next()) 
{
     int bus_no = rs.getInt("bus_id");
     String bus_name = rs.getString("bus_name");
     String seats = rs.getString("total_seats");
     String sleeper = rs.getString("ac_or_non_ac");
     String dep = rs.getString("departure");
     String des = rs.getString("destination");
     String price = rs.getString("price");

     // out.println(bus_no+"<br>");
     // out.println(bus_name+"<br>");
     // out.println(seats+"<br>");
     // out.println(sleeper+"<br>");
     // out.println(dep+"<br>");
     // out.println(des+"<br>");

    out.println("<tr><td>" + bus_no + "</td><td>" + bus_name + "</td><td>" + seats + "</td><td>" + sleeper + "</td><td>" + dep + "</td><td>" + des+"</td><td>"+price+"</td></tr>");
}
stmt.close();
c.commit();
c.close();
}
catch(Exception e){
}
%>
<br></table><br>
<a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a>
</center>
</body>
</html>