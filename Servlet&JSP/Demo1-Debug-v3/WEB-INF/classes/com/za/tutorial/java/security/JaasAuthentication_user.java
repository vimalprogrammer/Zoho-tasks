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

@WebServlet("/login_user")
public class JaasAuthentication_user extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter printWriter=response.getWriter();
		printWriter.println("<html><head><title>JAAS User</title></head><body>");
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

		//------------------------------------------------------
		System.setProperty("java.security.auth.login.config", "jaastutorial.config");

		//printWriter.println(userid+"<br>"+password+"<br>");
		if((userid != null) && (password != null))
		{
			ZaCallbackHandler2 zaCallbackHandler2 = new ZaCallbackHandler2(userid,password);
			boolean authenticatedFlag=true;
			LoginContext loginContext = null;
			try
			{
				loginContext = new LoginContext("ZaJaasTutorial2", zaCallbackHandler2);
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
				session.setAttribute("userid",userid);
				session.setAttribute("pwd",password);
				response.sendRedirect(request.getContextPath() + "/login2.jsp");
			}
			else
			{
			    String message = "Please enter valid credientials!";
			    request.setAttribute("message", message);
			    request.getRequestDispatcher("/login1.jsp").forward(request, response);
			}
		}
		else
		{
			printWriter.println("Invalid Authentication");
		}
		printWriter.println("</body></html>");		
	}
}
