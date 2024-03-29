import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.*;

//@WebServlet("/servlet2")
public class Result extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		res.setContentType("text/html");
		PrintWriter p = res.getWriter();

		String dcode = req.getParameter("code");
		p.println(dcode);
		HttpSession s = req.getSession();
		String tcode = (String)s.getAttribute("code");
		p.println(tcode);
		if(dcode.equals(tcode)){
			p.print("Verification success");
			response.sendRedirect(request.getContextPath() + "/admin_login.jsp");
		}
		else{
			p.print("Invalid code");
			response.sendRedirect(request.getContextPath() + "/QR_admin.jsp");
		}
	}
}