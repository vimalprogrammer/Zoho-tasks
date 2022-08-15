<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Final_Admit Jsp</title>
</head>
<body>

<%

String user_otp=request.getParameter("otp-code");
String code=String.valueOf(session.getAttribute("code"));

String sec_key=String.valueOf(session.getAttribute("sec_key"));

session.setAttribute("user_otp",user_otp);
session.setAttribute("real_otp",code);

if(user_otp.equals(code))
{
	out.println(user_otp+"<br>"+code);
	out.println(" Auth Success");
	request.getRequestDispatcher("/admin_login.jsp").forward(request, response);
}
else
{
	out.println(user_otp+"<br>"+code);
	out.println(" Auth Failure");
  // String message = "Invalid Pin!";
  // request.setAttribute("message", message);
  // request.getRequestDispatcher("code.jsp").forward(request, response);
}
out.println("<br>"+sec_key);
%>
<!--  -->

</body>
</html>