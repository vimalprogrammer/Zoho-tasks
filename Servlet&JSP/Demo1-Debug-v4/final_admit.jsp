<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Final_Admit Jsp</title>


</head>
<body>

<script type="text/javascript">
      function preventBack() {
    // body...
    window.history.forward();
}

setTimeout("preventBack()",0);
window=function(){null};
</script>

<%
out.println("<script type=\"text/javascript\">function preventBack(){window.history.forward();}setTimeout(\"preventBack()\",0);window=function(){null};</script>");
%>

<%

String user_otp=request.getParameter("otp-code");
String code=String.valueOf(session.getAttribute("code"));

String sec_key=String.valueOf(session.getAttribute("sec_key"));

session.setAttribute("user_otp",user_otp);
session.setAttribute("real_otp",code);

if(session.getAttribute("userid")==null)
{
    request.getRequestDispatcher("/logout_admin.jsp").forward(request, response);
    //response.sendRedirect("/logout_admin.jsp");
}

if(user_otp.equals(code))
{
	out.println(user_otp+"<br>"+code);
	out.println(" Auth Success");
	//request.getRequestDispatcher("/admin_login.jsp").forward(request, response);
	response.sendRedirect("admin_login.jsp");
}
else
{
    //out.println("<script>alert('Invalid Pin! Again Sign in to continue');</script>");
	// out.println(user_otp+"<br>"+code);
	// out.println(" Auth Failure");
	// String message = "Invalid Pin! Again Sign in to continue";
	// request.setAttribute("message", message);
	// request.getRequestDispatcher("/code.jsp").forward(request, response);
   // out.println("<meta http-equiv='refresh' content='1;URL=code.jsp'>");//redirects after 3 seconds
   // out.println("<center><p>Incorrect Pin!</p></center>");
   out.println("<script type=\"text/javascript\">");
   out.println("alert('Incorrect Pin!');");
   out.println("location='admin.jsp';");
   out.println("</script>");
   out.println(user_otp+"<br>"+code);
}

  response.setHeader ("Clear-Site-Data", "\"cache\"");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Expires","0");
  response.setDateHeader("Expires",-1);

//out.println("<br>"+sec_key);
	//response.sendRedirect("code.jsp");
%>
<!--  -->

</body>
</html>