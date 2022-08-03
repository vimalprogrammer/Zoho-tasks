<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Loginjsp</title>
<style>
.view {
  text-align: center;
  border: 3px solid green;
}
</style>
</head>
<body>

<div class="view"><br><br>Home<br><br><br></div>


<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>

<%

 String userid1 = request.getParameter("usr");
 String pwd1 = request.getParameter("pwd");
 session.setAttribute("userid",userid1);
 session.setAttribute("pwd",pwd1);

  String userid=String.valueOf(session.getAttribute("userid"));
  String pwd=String.valueOf(session.getAttribute("pwd"));

if(userid.equals("") || pwd.equals(""))
{
    String message = "Fields can't be empty!";
    request.setAttribute("message", message);
    request.getRequestDispatcher("/login1.jsp").forward(request, response);
}

else
{
 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 //c.setAutoCommit(false);
 Statement stmt = c.createStatement();
 ResultSet rs = stmt.executeQuery( "SELECT * FROM user_details where first_name='"+userid+"'");
 //out.println(userid);

 if(rs.next())
 {

    //debugging purpose
     // out.println(rs.getString(1));
     // out.println(rs.getString(2));
     // out.println(rs.getString(3));
     // out.println(rs.getString(4));
     // out.println(rs.getString(5));
     // out.println(rs.getString(6));
     // out.println(rs.getString(7));

    if(rs.getString(7).equals(pwd))
    {
        out.println("<center><h3>Welcome  "+userid+"<br></h3></center>");
    }
}

else
{
    String message = "Invalid credientials!";
    request.setAttribute("message", message);
    request.getRequestDispatcher("/login1.jsp").forward(request, response);
    stmt.close();
    c.close();
}
     //stmt.executeUpdate(sql);

    //stmt.executeUpdate(sql);

    session.setAttribute("userId", userid);
    out.println("</centre>");
}
%>

<center>
<br>
<br>
<br>
<a href="User/view_ticket.jsp">View My Tickets</a>
<br>
<br>
<a href="User/book_ticket1.jsp">Book Ticket</a>
<br><br>
<a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a></body>
<br>
<br>

<a href="index.html">Home</a><br>
</center>
</body>
</html>