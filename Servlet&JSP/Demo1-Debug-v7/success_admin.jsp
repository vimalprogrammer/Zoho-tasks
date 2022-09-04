 

 <script type="text/javascript">
      function preventBack() {
    // body...
    window.history.forward();
}

setTimeout("preventBack()",0);
window=function(){null};
</script>

 <%
 String name=(String)request.getParameter("name");
 String email=(String)request.getParameter("email");

 session.setAttribute("userid",name);
 session.setAttribute("email",email);
 response.sendRedirect("admin_login.jsp");
 %><br>

