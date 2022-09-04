<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%><!DOCTYPE html>
<html>
    <head>
    <meta
      name="google-signin-client_id"
    />
    <title>Vimal Travels</title>

<script type="text/javascript">
      function preventBack() {
    // body...
    window.history.forward();
}

setTimeout("preventBack()",0);
window=function(){null};
</script>
</head>
<body>

<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %>

 <%
 String name=(String)request.getParameter("name");
 String email=(String)request.getParameter("email");

 session.setAttribute("userid",name);
 session.setAttribute("email",email);

 String google_sign_in="1";
 session.setAttribute("google_sign_in",google_sign_in);

// out.println(name);
// out.println(email);

try{
     Class.forName("org.postgresql.Driver").newInstance();
     Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
     c.setAutoCommit(false);
     Statement stmt = c.createStatement();
     //ResultSet rs;

 ResultSet rs = stmt.executeQuery( "SELECT * FROM user_details where EMAIL='"+email+"'");
if(rs.next())
{
    stmt.close();
    c.commit();
    c.close();
    response.sendRedirect("login2.jsp");
}

else
{
     String sql = "INSERT INTO User_Details (FIRST_NAME,EMAIL) "
                      + "VALUES ('"+name+"','"+email+"');";
     stmt.executeUpdate(sql);
     //out.println("<br><br><br><center>User Registered Successfully!!!</center><br><br>");
    stmt.close();
    c.commit();
    c.close();
    response.sendRedirect("login2.jsp");

}
}

catch(Exception e){
        out.println("Error Caused\n "+e);        
        e.printStackTrace();
    }                                                                                              

 %><br>
</body>
</html>
