
import java.io.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;
import javax.servlet.*;  



@WebServlet("/add")
public class ServletDemo extends HttpServlet 
{
	public void doGet(HttpServletRequest req,HttpServletResponse res) 
	{
		try
		{
			int n1=Integer.parseInt(req.getParameter("num1"));
			int n2=Integer.parseInt(req.getParameter("num2"));
			
			int result=n1+n2;

			// PrintWriter out=res.getWriter();
			// out.print("result " + result);

			// RequestDispatcher rd=req.getRequestDispatcher("v"); 
			// rd.forward(req,res);

			//res.sendRedirect("v?result="+result);//URL Rewriting
			// req.setAttribute("r",result);

			//HttpSession session = req.getSession();
			//session.setAttribute("r",result);//key, value

			
			Cookie cookie = new Cookie("r",result+"");
			res.addCookie(cookie);

			res.sendRedirect("v");

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
}