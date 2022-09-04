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
  background-position: bottom 50px right 30px;
  background-repeat: no-repeat;
/*  margin-top: 130px;
*/
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
    <div class="bus"><center><br><h3>Admin Panel</h3><br></center></div>

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


 // session.setAttribute("userid",userid1);
 // session.setAttribute("pwd",pwd1);  

 // String userid=String.valueOf(session.getAttribute("userid"));
 // String pwd=String.valueOf(session.getAttribute("pwd"));


 String userid=String.valueOf(session.getAttribute("userid"));
 String pwd=String.valueOf(session.getAttribute("pwd"));

 // out.println(userid+"<br>"+pwd);
 // out.println("welcome "+userid);
 //  String email=String.valueOf(session.getAttribute("email"));
 // out.println("<br>Your Email is "+email);

//-----------------------------------------------------------------

// if(userid.equals("vimal") && pwd.equals("123"))//session handling
// {
//     //out.println("if innnnnnnnnnnn");
//     session.setAttribute("userid",userid);
    //response.sendRedirect("welcome.jsp");

    out.println("<div class='main'><marquee class='marq' direction='left' loop='infinite' > <div >Welcome to the Admin panel...</div></marquee></div>");

    out.println("<div class='bus1'>");
    out.println("<br><br><br>");
    out.println("<a href='Bus/add_bus1.jsp'><button type='button' class='btn btn-light' data-mdb-ripple-color='dark' style='color: black; font-size: 20px;''>ADD BUS</button></a><br><br>");        
    out.println("<a href='Bus/view_all_bus.jsp'><button type='button' class='btn btn-light' data-mdb-ripple-color='dark' style='color: black; font-size: 20px;''>VIEW BUS</button></a><br><br>");
    out.println("<a href='Bus/edit_bus1.jsp'><button type='button' class='btn btn-light' data-mdb-ripple-color='dark' style='color: black; font-size: 20px;''>EDIT BUS</button></a><br><br>");
    out.println("<a href='Bus/delete_bus1.jsp'><button type='button' class='btn btn-light' data-mdb-ripple-color='dark' style='color: black; font-size: 20px;''>DELETE BUS</button></a><br><br>");
    out.println("<a href='admin_register.jsp'><button type='button' class='btn btn-light' data-mdb-ripple-color='dark' style='color: black; font-size: 20px;''>Admin Register</button></a><br>");
    out.println("<br><br><br>");
    out.println("</div>");  

%>

<!-- <br><br><br>
<a href="Bus/add_bus.html">Add bus</a><br>        
<a href="Bus/view_bus.html">View Bus</a><br>
<a href="Bus/edit_bus.html">Edit Bus</a><br>
<a href="Bus/delete_bus.html">Delete Bus</a><br>
<a href="index.html">Logout</a><br>
<br><br><br> -->

<br>
<center><a href="logout_admin.jsp"><button type="button" class="btn btn-light" data-mdb-ripple-color="dark" style="color: black; font-size: 20px;">Logout</button></a><br><br></center>

</body>

</body>
</html>