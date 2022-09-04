<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Code Jsp</title>
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
  String code=String.valueOf(session.getAttribute("code"));
  session.setAttribute("code", code);
  String sec_key=String.valueOf(session.getAttribute("sec_key"));
  session.setAttribute("sec_key", sec_key);
  String qr=String.valueOf(session.getAttribute("qr"));
  session.setAttribute("qr", qr);
%>

<center>
<form action="final_admit.jsp" method="post">
  <h2>Open Google Authenticator app on your phone and scan this QR code</h2>
  <%
  // out.println(qr);
  // out.println(code);
  // out.println(sec_key);
  out.println("<center><img src='"+qr+"'></center>");
%>
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
