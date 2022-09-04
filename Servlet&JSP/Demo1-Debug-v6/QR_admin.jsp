<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>QR_Admin_jsp</title>

<!-- <script type="text/javascript">
      function preventBack() {
    // body...
    window.history.forward();
}

setTimeout("preventBack()",0);
window=function(){null};
</script> -->


</head>
<body>
    <div>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %> 


<%
         String userid=String.valueOf(session.getAttribute("userid"));
         String password=String.valueOf(session.getAttribute("pwd"));
         session.setAttribute("userid",userid);
         session.setAttribute("pwd",password); 

%>

</div>


<form action="servlet1" method="post">
    TWO<input type="submit" name="two_factor" value="two_factor">
</form>
</body>

</body>
</html>