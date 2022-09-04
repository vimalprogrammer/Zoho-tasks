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
}


if(user_otp.equals(code))
{
    out.println("<script type=\"text/javascript\">function preventBack(){window.history.forward();}setTimeout(\"preventBack()\",0);window=function(){null};</script>");
	out.println(user_otp+"<br>"+code);
	out.println(" Auth Success");
	//request.getRequestDispatcher("/login2.jsp").forward(request, response);
	response.sendRedirect("login2.jsp");
}
else
{
    out.println("<script type=\"text/javascript\">function preventBack(){window.history.forward();}setTimeout(\"preventBack()\",0);window=function(){null};</script>");
   out.println("<script type=\"text/javascript\">");
   out.println("alert('Incorrect Pin!');");
   out.println("location='login1.jsp';");
   out.println("</script>");
}
  response.setHeader ("Clear-Site-Data", "\"cache\"");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Expires","0");
  response.setDateHeader("Expires",-1);%>

<!--  -->

</body>
</html>