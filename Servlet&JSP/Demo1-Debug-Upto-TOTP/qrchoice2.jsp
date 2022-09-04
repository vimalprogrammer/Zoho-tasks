<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Code Jsp</title>
</head>
<style>
  .grow img{
transition: 0.5s ease;
}

.grow img:hover{
-webkit-transform: scale(1.2);
-ms-transform: scale(1.2);
transform: scale(1.2);
transition: 0.5s ease;
}
</style>

<style>
  body {
  justify-content: center;
  font-family: Roboto, Arial, sans-serif;
  font-size: 15px;
  }
</style>

<body>

<%
  String code=String.valueOf(session.getAttribute("code"));
  session.setAttribute("code", code);
  String sec_key=String.valueOf(session.getAttribute("sec_key"));
  session.setAttribute("sec_key", sec_key);
  String qr=String.valueOf(session.getAttribute("qr"));
  session.setAttribute("qr", qr);

if(session.getAttribute("userid")==null)
{
  response.sendRedirect("index.html");
}

%>

<center>
  <h2>Choose Your Authenticator tool</h2>
  <%
  // out.println(qr);
  // out.println(code);
  // out.println(sec_key);
  out.print("<div class='grow'><a href='code2.jsp'><center><img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLFO28Tu9Iy9K2t5Ey8SLHrT9_4ZheO0SiupcERywMrzDM2IrO3HGy5hqrEWQ-d1d70Kg&usqp=CAU' width='100' height='100'></center></a></div><br><br>");

    out.print("<div class='grow'><a href='code2.jsp'><center><img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr0CdSKMcEXF8fun9zNjwrZggc9os2DeFa0XaJ7PCCpDR1lu-vwn_1V9B-M2ePFI8AJqY&usqp=CAU' width='80' height='80'></center></a></div>");
%>
<center>
</center>
</form>
</center>
<center><p>${message}</p></center>
</body>
</html>
