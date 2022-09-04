<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Vimal Travels</title>
</head>
<style>
  body {
  justify-content: center;
  font-family: Roboto, Arial, sans-serif;
  font-size: 15px;
  }

  button {
  background-color: #8ebf42;
  color: white;
  padding: 10px 16px;
  margin: 10px 0;
  border: none;
  cursor: grabbing;
  width: 12%;
  opacity: 0.8;
  }

  input[type=text] {
  padding: 8px 14px;
  margin: 8px 0;
  box-sizing: border-box;
}


</style>
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

if(session.getAttribute("userid")==null)
{
  response.sendRedirect("index.html");
}

%>

<center>
<form action="final_admit2.jsp" method="post">
  <h2>Open your Authenticator app on your phone and scan this QR code</h2>
  <%
  // out.println(qr);
  // out.println(code);
  // out.println(sec_key);
  out.println("<center><img src='"+qr+"'></center>");
%>
  <input type="text" name="otp-code" placeholder="Enter code"><br><br>
  <button type="submit" >Submit</button>
</form>
</center>
</form>
</center>
<center><p>${message}</p></center>
</body>
</html>
