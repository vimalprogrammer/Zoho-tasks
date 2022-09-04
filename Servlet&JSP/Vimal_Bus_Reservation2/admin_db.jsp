<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vimal Travels</title>


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
    //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    // response.setHeader("Pragma", "no-cache"); 
    // response.setDateHeader("Expires", 0);

     String user = request.getParameter("usr");
     String pwd = request.getParameter("pwd");

      session.setAttribute("usr",user);
      session.setAttribute("pwd",pwd);  

      String user1=String.valueOf(session.getAttribute("usr"));
      String pwd1=String.valueOf(session.getAttribute("pwd"));

     if(session.getAttribute("userid")==null || session.getAttribute("usr")==null)
     {
          response.sendRedirect("admin.jsp");
     }

    if(user.equals("") ||  pwd.equals(""))
    {
     String message = "Please Provide Valid Details..!";
     request.setAttribute("message", message);
     request.getRequestDispatcher("/admin_register.jsp").forward(request, response);
    }
    else
    {
         Class.forName("org.postgresql.Driver").newInstance();
         Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
         //c.setAutoCommit(false);
         Statement stmt = c.createStatement();
         //ResultSet rs;
         String sql = "INSERT INTO Admin_Details (ADMIN_NAME, ADMIN_PASSWORD) "
                          + "VALUES ('"+user+"','"+pwd+"');";
         
          // String message = "Admin Details added Successfully!";
          // request.setAttribute("message", message);
          // request.getRequestDispatcher("/admin.jsp").forward(request, response);

          out.println("<script type=\"text/javascript\">");
          out.println("alert('Admin Details added Successfully!');");
          out.println("location='admin.jsp';");
          out.println("</script>");

         stmt.executeUpdate(sql);
        stmt.close();
        c.close();
    }

}

catch(Exception e)
{
        out.println("Error Caused\n "+e);        
        e.printStackTrace();
}

%>
<a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a></body>
</body>
</html>