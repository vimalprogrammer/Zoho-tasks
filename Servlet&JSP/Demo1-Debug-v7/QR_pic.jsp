<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vimal Travels</title>

<!-- <script type="text/javascript">
      function preventBack() {
    // body...
    window.history.forward();
}

setTimeout("preventBack()",0);
window=function(){null};
</script> -->

<center><a href="qr" style="font-size:20px;">Click for 2 factor Authentication</a><br></center>

</head>
<body>
    <div>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %> 

<center><img src="WEB-INF\classes\com\za\tutorial\java\security\QRCode.png"></center>

<%
    String otp_code=String.valueOf(session.getAttribute("code"));
    session.setAttribute("real_otp",otp_code);
%>

<form action="admin_login.jsp" method="post">
    Enter QR Code: <input type="text" name="user_otp">
</form>
</div>
</body>

</body>
</html>