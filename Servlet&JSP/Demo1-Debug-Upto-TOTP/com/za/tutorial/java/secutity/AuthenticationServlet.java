package com.za.tutorial.java.secutity;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.login.LoginContext;
import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;


@WebServlet("/AuthenticationServlet")
public class AuthenticationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter printWriter=response.getWriter();
		printWriter.println("<html><head><title>JAAS Web Apllication Tutor</title></head><body>");
		// String user = request.getParameter("user");
		// String password= request.getParameter("password");

		//-------------------------------------------------
		String user = request.getParameter("usr");
		String password = request.getParameter("pwd");

			request.setAttribute("userid", user);
			request.setAttribute("pwd", password);

			// Forward to /WEB-INF/views/login.jsp
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/admin.jsp");

			dispatcher.forward(request, response);

		//------------------------------------------------------

		printWriter.println(user+"<br>"+password+"<br>");
		if((user != null) && (password != null))
		{
			ZaCallbackHandler zaCallbackHandler = new ZaCallbackHandler(user,password);
			boolean authenticatedFlag=true;
			try
			{
				LoginContext loginContext = new LoginContext("ZaJaasTutorial",zaCallbackHandler);
				loginContext.login();
			} 
			catch (LoginException e) 
			{
				authenticatedFlag=false;
			}	
			if( authenticatedFlag)
				printWriter.println("Authentication Success");
			else
				printWriter.println("Authentication Failure");
		}
		else
		{
			printWriter.println("Invalid Authentication");
		}
		printWriter.println("</body></html>");		
	}
}
