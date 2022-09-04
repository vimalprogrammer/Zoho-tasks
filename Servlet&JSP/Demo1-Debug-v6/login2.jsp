<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Loginjsp</title>
<!-- <script type="text/javascript">
      function preventBack() {
    // body...
    window.history.forward();
}

setTimeout("preventBack()",0);
window=function(){null};
</script> -->

<style>
.view {
  text-align: center;
  border: 3px solid green;
  background-color: lightblue;
}
</style>

<style>
body {


  background-image: url('https://www.nicepng.com/png/full/10-102524_travel-bus-png-bus-booking.png');
  height: 20%;

  /* Center and scale the image nicely */
  background-position: right;
  background-position: bottom -100px right 30px;
  background-repeat: no-repeat;
/*  margin-top: 130px;
*/
}
</style>

<!-- <style>
body {


  background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVyEwr8WK13ma2cAlaiYbUaPvvGzIPV2AAKw&usqp=CAU');
  height: 20%;

  /* Center and scale the image nicely */
  background-position: left;
  background-position: bottom -100px left 30px;
  background-repeat: no-repeat;
/*  margin-top: 130px;
*/

}
</style> -->

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

 out.println("<div class='main'><marquee class='marq' direction='left' loop='infinite' > <div >Welcome to our site...</div></marquee></div>");

//response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 

// out.println("<div style='position: absolute; top: 0; right: 1; width: 100px; text-align:right;'><br><br><br><br><br><br><br>");
// out.println("<a href='logout_user.jsp' style='font-size:20px;'>Logout</a><br>");
// out.println("</div>");

if(session.getAttribute("userid")==null)
{
  response.sendRedirect("index.html");
}

 boolean flag=false;

 // String userid1 = request.getParameter("usr");
 // String pwd1 = request.getParameter("pwd");
 // session.setAttribute("userid",userid1);
 // session.setAttribute("pwd",pwd1);

  String userid=String.valueOf(session.getAttribute("userid"));
  String pwd=String.valueOf(session.getAttribute("pwd"));

  session.setAttribute("userid",userid);
  session.setAttribute("pwd",pwd);

  out.println("<center><h3>Welcome  "+userid+"<br></h3></center>");



// if(userid.equals("vimal") && pwd.equals("123"))
// {
//     session.setAttribute("userid",userid);//session handling

// if(userid.equals("") || pwd.equals(""))
// {
//     String message = "Fields can't be empty!";
//     request.setAttribute("message", message);
//     request.getRequestDispatcher("/login1.jsp").forward(request, response);
// }

// else
// {
//  Class.forName("org.postgresql.Driver").newInstance();
//  Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
//  //c.setAutoCommit(false);
//  Statement stmt = c.createStatement();
//  ResultSet rs = stmt.executeQuery( "SELECT * FROM user_details where first_name='"+userid+"'");
//  //out.println(userid);

//  if(rs.next())
//  {

    //debugging purpose
     // out.println(rs.getString(1));
     // out.println(rs.getString(2));
     // out.println(rs.getString(3));
     // out.println(rs.getString(4));
     // out.println(rs.getString(5));
     // out.println(rs.getString(6));
     // out.println(rs.getString(7));

//     if(rs.getString(7).equals(pwd))
//     {
//         flag=true;
//         session.setAttribute("userid",userid);
//         out.println("<center><h3>Welcome  "+userid+"<br></h3></center>");
//         stmt.close();
//         c.close();
//     }
// }

// else
// {
//     String message = "Invalid credientials!";
//     request.setAttribute("message", message);
//     request.getRequestDispatcher("/login1.jsp").forward(request, response);
//     stmt.close();
//     c.close();
// }
//      //stmt.executeUpdate(sql);

//     //stmt.executeUpdate(sql);

//     session.setAttribute("userId", userid);
//     out.println("</centre>");
// }

// if(!flag)
// {
//     String message = "Invalid credientials!";
//     request.setAttribute("message", message);
//     request.getRequestDispatcher("/login1.jsp").forward(request, response);
// }

%>

<center>
<br>
<br>
<br>
<a href="User/view_ticket.jsp">VIEW MY TICKETS</a>
<br>
<br>
<a href="User/book_ticket1.jsp">BOOK TICKET</a>
<br><br>
<br>
<br>
<center><a href="logout_admin.jsp" style="font-size:20px;">Logout</a><br></center>
</center>
</body>
</html>
