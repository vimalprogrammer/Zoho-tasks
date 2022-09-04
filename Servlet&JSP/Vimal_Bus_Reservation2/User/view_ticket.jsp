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

<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>

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

<center>
<div class="view"><br><br>View Tickets<br><br><br></div>
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
            Ticket ID
        </th>
        <th>
            Bus No
        </th>
        <th>
            Price
        </th>
    </tr>
<%
try
{

 String username=String.valueOf(session.getAttribute("userid"));
 String email=String.valueOf(session.getAttribute("email"));
 

    //out.println(username+"<br>"); 

 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 //c.setAutoCommit(false);
 Statement stmt = c.createStatement();
 ResultSet rs = stmt.executeQuery( "SELECT * FROM ticket_bookings where mail='"+email+"'");

 while(rs.next())
 {
     // out.println(rs.getString(1));
     // out.println(rs.getString(2));
     // out.println(rs.getString(3));
     // out.println(rs.getString(4));
     // out.println(rs.getString(5));
     // out.println(rs.getString(6));
    
out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2)+ "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td><td>" +rs.getString(5) +"</td><td>"+rs.getString(6)+"</td></tr>");

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
<br>
<a href="#" style="color: black;" onclick="javascript:window.history.back(-1);return false;">Back</a></center></body>

</body>
</html>