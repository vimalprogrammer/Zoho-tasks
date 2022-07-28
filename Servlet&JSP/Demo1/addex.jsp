<html>
	<body>
    	<%	
        out.println("<html><body bgcolor='yellow'>");

        out.print("<br>Hello ");

        ServletContext ctxt=getServletContext();
        ServletConfig cnfg=getServletConfig();      
        String s1=ctxt.getInitParameter("name");//config
        String s2=ctxt.getInitParameter("college");
        String s3=ctxt.getInitParameter("crush");
        String s4=ctxt.getInitParameter("friend");

        out.print(s1+"<br>"+s2+"<br>"+s3+"<br>"+s4);
        out.println("</body></html>");
        %>
    </body>
</html>