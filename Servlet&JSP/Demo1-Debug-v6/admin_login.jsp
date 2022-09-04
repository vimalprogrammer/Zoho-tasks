<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin_jsp</title>
<style>
.bus {
  text-align: center;
  border: 3px solid green;
    background-color: lightblue;
}
.bus1 {
  text-align: center;
}
</style>

<!-- <script type="text/javascript">
      function preventBack() {
    // body...
    window.history.forward();
}

setTimeout("preventBack()",0);
window=function(){null};
</script> -->

<style>
body {

  background-image: url('https://www.nicepng.com/png/full/10-102524_travel-bus-png-bus-booking.png');
  height: 20%;

  /* Center and scale the image nicely */
  background-position: right;
  background-position: bottom -10px right 30px;
  background-repeat: no-repeat;
/*  margin-top: 130px;
*/
}
</style>


</head>
<body>
    <div>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %> 

<%
//-------------------------------------------------------------------------
    //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 

if(session.getAttribute("userid")==null)
{
    //request.getRequestDispatcher("/logout_admin.jsp").forward(request, response);
    response.sendRedirect("index.html");
}


// out.println(user_otp);
// out.println(real_otp);

 boolean flag=false;

 // String userid1 = request.getParameter("usr");
 // String pwd1 = request.getParameter("pwd");

 // session.setAttribute("userid",userid1);
 // session.setAttribute("pwd",pwd1);  

 // String userid=String.valueOf(session.getAttribute("userid"));
 // String pwd=String.valueOf(session.getAttribute("pwd"));


 String userid=String.valueOf(session.getAttribute("userid"));
 String pwd=String.valueOf(session.getAttribute("pwd"));

 // out.println(userid+"<br>"+pwd);

//-----------------------------------------------------------------

// if(userid.equals("vimal") && pwd.equals("123"))//session handling
// {
//     //out.println("if innnnnnnnnnnn");
//     session.setAttribute("userid",userid);
    //response.sendRedirect("welcome.jsp");



if(userid.equals("") || pwd.equals(""))
{
// String message = "Fields can't be empty!";
// response.sendRedirect("admin.jsp?message=" + URLEncoder.encode(message, "UTF-8")); }
String message = "Fields can't be empty!";
request.setAttribute("message", message);
request.getRequestDispatcher("/admin.jsp").forward(request, response);
}

else
{
 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 //c.setAutoCommit(false);
 Statement stmt = c.createStatement();
 ResultSet rs = stmt.executeQuery( "SELECT * FROM admin_details where admin_name='"+userid+"'");

if(rs.next())
{

session.setAttribute("userid",userid);
flag=true;

if(rs.getString(3).equals(pwd))
{
    out.println("<div class='bus'>");
    out.println("<br><br><center> Admin Page <br><br><br>");
    out.println("</div>"); 

    out.println("<div class='main'><marquee class='marq' direction='left' loop='infinite' > <div >Welcome to the Admin panel...</div></marquee></div>");

    out.println("<div class='bus1'>");
    out.println("<br><br><br>");
    out.println("<a href='Bus/add_bus1.jsp' style='font-size:20px; color:black;'>ADD BUS</a><br><br>");        
    out.println("<a href='Bus/view_all_bus.jsp' style='font-size:20px;color:black;' >VIEW BUS</a><br><br>");
    out.println("<a href='Bus/edit_bus1.jsp' style='font-size:20px;color:black;'>EDIT BUS</a><br><br>");
    out.println("<a href='Bus/delete_bus1.jsp' style='font-size:20px;color:black;'>DELETE BUS</a><br><br>");
    out.println("<a href='admin_register.jsp' style='font-size:20px;color:black;'>Admin Register</a><br>");
    out.println("<br><br><br>");
    out.println("</div>");  
}  
else
{
   out.println("<script type=\"text/javascript\">");
   out.println("alert('Incorrect Pin!');");
   out.println("location='admin.jsp';");
   out.println("</script>");
}

}
}

%>

<!-- <br><br><br>
<a href="Bus/add_bus.html">Add bus</a><br>        
<a href="Bus/view_bus.html">View Bus</a><br>
<a href="Bus/edit_bus.html">Edit Bus</a><br>
<a href="Bus/delete_bus.html">Delete Bus</a><br>
<a href="index.html">Logout</a><br>
<br><br><br> -->

<br><br>
<center><a href="logout_admin.jsp" style="font-size:20px;">Logout</a><br></center>
</body>

</body>
</html>