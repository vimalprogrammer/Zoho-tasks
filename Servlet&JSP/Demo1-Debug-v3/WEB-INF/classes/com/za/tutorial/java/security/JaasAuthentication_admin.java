package com.za.tutorial.java.security;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpSession;

import javax.security.auth.login.LoginContext;
import javax.security.auth.login.LoginException; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/login_admin")
public class JaasAuthentication_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter printWriter=response.getWriter();
		printWriter.println("<html><head><title>JAAS</title></head><body>");
		// String user = request.getParameter("user");
		// String password= request.getParameter("password");

		//-------------------------------------------------
		String userid1 = request.getParameter("usr");
		String password1 = request.getParameter("pwd");

		 HttpSession session = request.getSession();

		 session.setAttribute("userid",userid1);
		 session.setAttribute("pwd",password1);  

		 String userid=String.valueOf(session.getAttribute("userid"));
		 String password=String.valueOf(session.getAttribute("pwd"));

			// Forward to /WEB-INF/views/login.jsp
			// RequestDispatcher dispatcher //
			// 		= this.getServletContext().getRequestDispatcher("/admin.jsp");

			// dispatcher.forward(request, response);

			// printWriter.println(userid);
			// printWriter.println(password);
			// printWriter.println(userid);
			// printWriter.println(password);
			// printWriter.println(userid);
			// printWriter.println(password);
			// printWriter.println(userid);
			// printWriter.println(password);

		//------------------------------------------------------
		System.setProperty("java.security.auth.login.config", "jaastutorial.config");

		//printWriter.println(userid+"<br>"+password+"<br>");
		if((userid != null) && (password != null))
		{
			ZaCallbackHandler zaCallbackHandler = new ZaCallbackHandler(userid,password);
			boolean authenticatedFlag=true;
			LoginContext loginContext = null;
			try
			{
				loginContext = new LoginContext("ZaJaasTutorial", zaCallbackHandler);
				loginContext.login();
			} 
			catch (LoginException e) 
			{
				authenticatedFlag=false;
			}	
			if(authenticatedFlag)
			{
				//printWriter.println("Authentication Success!!!");
				printWriter.println(userid);
				printWriter.println(password);
				//response.sendRedirect(request.getContextPath() + "/QR_admin.jsp");
				//response.sendRedirect("/servlet1");
		        request.getRequestDispatcher("/servlet1").forward(request, response);

			}
			else
			{
			    String message = "Invalid credientials!";
			    request.setAttribute("message", message);
			    request.getRequestDispatcher("/admin.jsp").forward(request, response);
			}
		}
		else
		{
			printWriter.println("Invalid Authentication");
		}
		printWriter.println("</body></html>");		
	}
}
