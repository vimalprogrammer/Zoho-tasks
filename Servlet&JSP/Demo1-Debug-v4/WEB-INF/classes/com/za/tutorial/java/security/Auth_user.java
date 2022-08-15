package com.za.tutorial.java.security;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import static com.za.tutorial.java.security.Code_user.getTOTPCode;


import javax.servlet.http.HttpSession;
import com.google.zxing.WriterException;

@WebServlet("/servlet_user")
public class Auth_user extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		res.setContentType("text/html");
		PrintWriter p = res.getWriter();

		 HttpSession session = req.getSession();

		String user=String.valueOf(session.getAttribute("userid"));
		p.println(user);
        Connection c = null;
        Statement stmt = null;
		try
		{
	     Class.forName("org.postgresql.Driver");
	     c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
	     //c.setAutoCommit(false);
	     stmt = c.createStatement();
		 ResultSet rs = stmt.executeQuery( "SELECT * FROM user_details where first_name='"+user+"'");
	 
		 // String sec_key="";
		 // if(rs.next())
		 // {
		 rs.next();
		  String sec_key=rs.getString("secret_key");
		 //}

		 if(sec_key==null)
		 {
			String key = Code_user.generateSecretKey();

		     String sql = "UPDATE user_details SET secret_key = '"+key+"' where first_name='"+user+"';";
		     stmt.executeUpdate(sql);
		     //out.println("<br><br><br><center>User Registered Successfully!!!</center><br><br>");
		     stmt.close();
		     c.close();

			//String key="CUPPS2FZTRSDZBOCXT4MA7PRT6HXEL65";

	         String name=String.valueOf(session.getAttribute("userid"));
	         String email=String.valueOf(session.getAttribute("pwd"));
	         session.setAttribute("sec_key",key);
			
			String barCodeUrl = Code.getGoogleAuthenticatorBarCode(key, email, name);

			//Code.createQRCode(barCodeUrl, "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\Demo1-Debug-v3\\QRCode.png", 400, 400);
			//otpauth://totp/tcs%3Avars?secret=QDWSM3OYIPGTEVSPB5FKVDM3CSNCWHOP&issuer=tcs
			//https://chart.googleapis.com/chart?cht=qr&chl=otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example&chs=160x160&chld=L|0
			
			//https://chart.googleapis.com/chart?cht=qr&chl=otpauth://totp/vimal?secret=JBSWY3DPEHPK3PXP&chs=160x160&chld=L|0
			String qr="https://chart.googleapis.com/chart?cht=qr&chl=otpauth://totp/"+name+"?secret="+key+"&chs=160x160&chld=L|0";
			//String qr="https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl="key"&choe=UTF-8";
			session.setAttribute("qr",qr);
			Code.createQRCode(barCodeUrl, "qr", 400, 400);
			//catch(Exception e){p.println("Exception : "+e);}
			String code = Code.getTOTPCode(key);

			session.setAttribute("code", code);
			
			//req.getRequestDispatcher("code.jsp").forward(req, res);
			res.sendRedirect("code2.jsp");
		}
		else
		{
		    String key = rs.getString("secret_key");
		    //out.println("<br><br><br><center>User Registered Successfully!!!</center><br><br>");
		    stmt.close();
		    c.close();

			//String key="CUPPS2FZTRSDZBOCXT4MA7PRT6HXEL65";

	        String name=String.valueOf(session.getAttribute("userid"));
	        String email=String.valueOf(session.getAttribute("pwd"));

	         session.setAttribute("sec_key",key);
			
			String barCodeUrl = Code.getGoogleAuthenticatorBarCode(key, email, name);

			//Code.createQRCode(barCodeUrl, "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\Demo1-Debug-v3\\QRCode.png", 400, 400);
			//otpauth://totp/tcs%3Avars?secret=QDWSM3OYIPGTEVSPB5FKVDM3CSNCWHOP&issuer=tcs
			//https://chart.googleapis.com/chart?cht=qr&chl=otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example&chs=160x160&chld=L|0
			
			//https://chart.googleapis.com/chart?cht=qr&chl=otpauth://totp/vimal?secret=JBSWY3DPEHPK3PXP&chs=160x160&chld=L|0
			String qr="https://chart.googleapis.com/chart?cht=qr&chl=otpauth://totp/"+name+"?secret="+key+"&chs=160x160&chld=L|0";
			//String qr="https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl="key"&choe=UTF-8";
			session.setAttribute("qr",qr);
			Code.createQRCode(barCodeUrl, "qr", 400, 400);
			//catch(Exception e){p.println("Exception : "+e);}
			String code = Code.getTOTPCode(key);

			session.setAttribute("code", code);
			
			//req.getRequestDispatcher("code.jsp").forward(req, res);
			res.sendRedirect("code2.jsp");
			
		}
	}
catch(Exception e){
	p.println("Exception is : "+ e);
}
}
}
