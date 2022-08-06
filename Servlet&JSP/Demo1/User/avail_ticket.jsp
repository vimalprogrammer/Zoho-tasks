<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AvailTktjsp</title>
<style>
.tkts {
  text-align: center;
  border: 3px solid green;
}
</style>
</head>
<body>

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


</center>
<% out.println("<div class='tkts'><br><br><center> Avilable Buses <br><br><br></div>");%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>

<center><br><br>
<table border="1" cellpadding="5" width="500">
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
    </tr>
<%
try
{
 
 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
 String departure1 = request.getParameter("dep");
 String destination1 = request.getParameter("des");

session.setAttribute("dep1",departure1);
session.setAttribute("des1",destination1);  

 String departure=String.valueOf(session.getAttribute("dep1"));
 String destination=String.valueOf(session.getAttribute("des1"));

 if(departure.equals("") || destination.equals(""))
 {
     String message = "Fields Can't be empty..!";
     request.setAttribute("message", message);
     request.getRequestDispatcher("book_ticket1.jsp").forward(request, response);
 }

 // if(departure1==null || destination1==null)
 // {
 //    response.sendRedirect("avail_ticket.jsp");
 // }

 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 //c.setAutoCommit(false);
 Statement stmt = c.createStatement();
 ResultSet rs = stmt.executeQuery( "SELECT * FROM bus_details where departure='"+departure+"' and destination='"+destination+"'");

 while(rs.next())
 {
    //out.println("AvailTKt in");
    //debugging purpose
     String bus_no = rs.getString("bus_id");
     String bus_name = rs.getString("bus_name");
     String seats = rs.getString("total_seats");
     String sleeper = rs.getString("ac_or_non_ac");
     String dep = rs.getString("departure");
     String des = rs.getString("destination");

     // out.println(bus_no+"<br>");
     // out.println(bus_name+"<br>");
     // out.println(seats+"<br>");
     // out.println(sleeper+"<br>");
     // out.println(dep+"<br>");
     // out.println(des+"<br>");

     out.println("<tr><td>" + bus_no + "</td><td>" + bus_name + "</td><td>" + seats + "</td><td>" + sleeper + "</td><td>" + dep + "</td><td>" + des+"</td></tr>");
 } 
 //stmt.executeUpdate(sql);
//stmt.executeUpdate(sql);
stmt.close();
c.close();

}

//Enter the bus number of your choice:

catch(Exception e)
{
    out.println("Error Caused\n "+e);        
    e.printStackTrace();
}

%>
</table>
<br><br>
    <form method="post" action="book_tkt.jsp">
        <center>
        <table border="1" width="30%" cellpadding="3">
            <thead>
                <tr>
                    <th colspan="2" align ="left">Book Ticket Here</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Enter Bus Number to book ticket</td>
                    <td><input type="text" name="bus_number" value="${param.bus_number}" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Book" /></td>
                    <td><input type="reset" value="Reset" /></td>
                </tr>
                <tr>
                </tr>
            </tbody>
        </table>
        </center>
    </form>
<br><br>
<center><p>${message}</p>
<center><a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a></center>
</center>
</body>

</body>
</html>