<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Vimal Travels</title>
</head>
<body>

<%

String code=String.valueOf(session.getAttribute("code"));
session.setAttribute("code", code);
String sec_key=String.valueOf(session.getAttribute("sec_key"));
session.setAttribute("sec_key", sec_key);

%>
<center>
<br><br>
<br><br><br><form action="final_admit.jsp" method="post">
	<input type="text" name="otp-code" placeholder="Enter code"><br><br>
	<input type="submit" value="login">
</form>
</center>
</body>
</html>