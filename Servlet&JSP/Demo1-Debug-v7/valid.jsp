<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<%
out.println("<script type=\"text/javascript\">function preventBack(){window.history.forward();}setTimeout(\"preventBack()\",0);window=function(){null};</script>");
%>

<%
response.sendRedirect("admin_login.jsp");
%>


<!--  -->

</body>
</html>