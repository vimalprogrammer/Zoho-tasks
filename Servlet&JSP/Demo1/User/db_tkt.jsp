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

<div class="view"><br><br>Invoice<br><br><br></div>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>

<%

try
{
 String name = request.getParameter("name");
 String mail = request.getParameter("mail");
 String phone = request.getParameter("phone");
 String gender = request.getParameter("gender");
 String ticket_no = request.getParameter("ticket_no");

  if(name.equals("") || mail.equals("") || phone.equals("") || gender.equals("") || ticket_no.equals(""))
  {
    String message = "Fields can't be empty!";
    request.setAttribute("message", message);
    request.getRequestDispatcher("booked.jsp").forward(request, response);
  }


   Class.forName("org.postgresql.Driver").newInstance();
   Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
   c.setAutoCommit(false);
    //out.println("Opened ~~database~~ successfully");


  Statement stmt = c.createStatement();
  String sql = "INSERT INTO ticket_bookings (name,mail,phone,gender,ticket_no) "
    + "VALUES ('"+name+"','"+mail+"','"+phone+"','"+gender+"','"+ticket_no+"');";

  stmt.executeUpdate(sql);
  stmt.close();
  c.commit();
  c.close();
  // String message = "Ticket Booked Succesfully";
  // request.setAttribute("message", message);
  // request.getRequestDispatcher("booked.jsp").forward(request, response);
  }

  catch(Exception e){
  }
%>
<center>
<br><br>
<table border="1" cellpadding="5" width="500">
    <tr>
        <th>
            User_ID
        </th>
        <th>
            User Name
        </th>
        <th>
            Email
        </th>
        <th>
            Phone
        </th>
        <th>
            Gender
        </th>
        <th>
            Ticket ID
        </th>
    </tr>
<%
try
{

 String username = request.getParameter("name");
    //out.println(username+"<br>"); 

 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 //c.setAutoCommit(false);
 Statement stmt = c.createStatement();
 ResultSet rs = stmt.executeQuery( "SELECT * FROM ticket_bookings where name='"+username+"'");

 while(rs.next())
 {

out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2)+ "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td><td>" +rs.getString(5) + "</td><td>" + rs.getString(6) +"</td></tr>");

 }
 out.println("</table>");
 //stmt.executeUpdate(sql);

//stmt.executeUpdate(sql);
stmt.close();
c.close();

}

catch(Exception e)
{
    out.println("Error Caused\n "+e);        
    e.printStackTrace();
}

%>

</table>
<br>
<a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a></center></body>
</html>