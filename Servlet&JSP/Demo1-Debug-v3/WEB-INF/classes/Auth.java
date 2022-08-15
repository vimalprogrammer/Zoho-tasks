import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.google.zxing.WriterException;

//@WebServlet("/servlet1")
public class Auth extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		res.setContentType("text/html");
		PrintWriter p = res.getWriter();

		String key = Code.generateSecretKey();
	
         String name=String.valueOf(session.getAttribute("userid"));
         String email=String.valueOf(session.getAttribute("pwd"));
		
		String barCodeUrl = Code.getGoogleAuthenticatorBarCode(key, email, name);
		try{
			Code.createQRCode(barCodeUrl, "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\auth\\QRCode.png", 400, 400);
		}
		catch(Exception e){}
		
		String code = Code.getTOTPCode(key);

		HttpSession s = req.getSession();
		s.setAttribute("code", code);
		
		req.getRequestDispatcher("code.html").forward(req, res);
		
	}
}