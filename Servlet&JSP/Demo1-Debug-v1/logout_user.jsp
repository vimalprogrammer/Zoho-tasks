<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>logout_user</title>
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
  response.setHeader ("Clear-Site-Data", "\"cache\"");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Expires","0");
  response.setDateHeader("Expires",-1);
  if(session.getAttribute("userid")!=null)
  {  
    session.removeAttribute("userid");
    request.getSession(false);
    session.setAttribute("userid",null);
    session.invalidate();
    // response.sendRedirect("/Demo1");
    response.sendRedirect("login1.jsp");
  }
%>

</body>
</html>