package com.za.tutorial.java.security;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import static com.za.tutorial.java.security.Code.getTOTPCode;


import javax.servlet.http.HttpSession;
import com.google.zxing.WriterException;

@WebServlet("/servlet1")
public class Auth extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		res.setContentType("text/html");
		PrintWriter p = res.getWriter();

		//String key = Code.generateSecretKey();

		String key="CUPPS2FZTRSDZBOCXT4MA7PRT6HXEL65";

	    HttpSession session = req.getSession();
         String name=String.valueOf(session.getAttribute("userid"));
         String email=String.valueOf(session.getAttribute("pwd"));

         session.setAttribute("sec_key",key);
		
		String barCodeUrl = Code.getGoogleAuthenticatorBarCode(key, email, name);
		try
		{
			Code.createQRCode(barCodeUrl, "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\Bus_Res\\QRCode.jpeg", 400, 400);
		}
		catch(Exception e){p.println("Exception : "+e);}
		String code = Code.getTOTPCode(key);

		session.setAttribute("code", code);
		
		req.getRequestDispatcher("code.jsp").forward(req, res);
		
	}
}