<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Code Jsp</title>
</head>
<body>

<%

String code=String.valueOf(session.getAttribute("code"));
  session.setAttribute("code", code);
  String sec_key=String.valueOf(session.getAttribute("sec_key"));
  session.setAttribute("sec_key", sec_key);

%>
<center>
<form action="final_admit.jsp" method="post">
  <h2>Open Google Authenticator app on your phone and scan this QR code</h2>
  <center><img src="QRCode.jpeg" /><br></center>
<center>
  <input type="text" name="otp-code" placeholder="Enter code"><br><br>
  <input type="submit" value="submit">
</form>
</center>
</form>
</center>
<center><p>${message}</p></center>
</body>
</html>
