<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vimal Travels</title>

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

<%
try
{
    // response.setHeader("Pragma", "no-cache"); 
    // response.setDateHeader("Expires", 0);

    //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    
     String user = request.getParameter("fname");
     session.putValue("userid",user);
     String lname = request.getParameter("lname");
     String email = request.getParameter("email");
     session.setAttribute("email",email);
     String phone = request.getParameter("ph");
     session.setAttribute("phone",phone);
     String gender = request.getParameter("gender");
     session.setAttribute("gender",gender);
     String pwd = request.getParameter("pwd");

    if(user.equals("") || lname.equals("") || email.equals("") || phone.equals("") || gender.equals("") || pwd.equals(""))
    {
        String message = "All fields are mandatory !!";
        request.setAttribute("message", message);
        request.getRequestDispatcher("/Reg.jsp").forward(request, response);
    }

     Class.forName("org.postgresql.Driver").newInstance();
     Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
     //c.setAutoCommit(false);
     Statement stmt = c.createStatement();
     //ResultSet rs;

 ResultSet rs = stmt.executeQuery( "SELECT * FROM user_details where EMAIL='"+email+"'");
if(rs.next())
{
    String message = "User with this email already xists!";
    request.setAttribute("message", message);
    request.getRequestDispatcher("Reg.jsp").forward(request, response);
    stmt.close();
    c.commit();
    c.close();
}
else
{
     String sql = "INSERT INTO User_Details (FIRST_NAME,LAST_NAME,EMAIL,PHONE,GENDER,PASSWORD) "
                      + "VALUES ('"+user+"','"+lname+"','"+email+"','"+phone+"','"+gender+"','"+pwd+"');";
     stmt.executeUpdate(sql);
     //out.println("<br><br><br><center>User Registered Successfully!!!</center><br><br>");
    stmt.close();
    c.close();
}

String message = "User Registered Successfully, Login with your credentials.";
request.setAttribute("message", message);
request.getRequestDispatcher("/login1.jsp").forward(request, response);

}

catch(Exception e){
        out.println("Error Caused\n "+e);        
        e.printStackTrace();
    }
%>

<center>
    <a href="login1.jsp">Login</a><br><br>
    <a href="index.html">Home</a><br><br>
</body>
</center>
</body>
</html>