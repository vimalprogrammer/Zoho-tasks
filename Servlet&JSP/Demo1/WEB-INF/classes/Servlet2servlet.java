import javax.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;
import javax.servlet.*;  

//@WebServlet("/v")
public class Servlet2servlet extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		
		// int sol=(int)req.getAttribute("r");//it is object so converting into string

		// int sol=Integer.parseInt(req.getParameter("result"));
		// sol=sol*sol;
		//PrintWriter out=res.getWriter();

		//HttpSession session = req.getSession();

		int sol=1;
		Cookie cookies[]=req.getCookies();
		for(Cookie c:cookies)
		{
			if(c.getName().equals("r"))
				sol=Integer.parseInt(c.getValue());
		}

	 	//int sol=(int) session.getAttribute("r");

	 	sol=sol*sol;
		//out.println("Result(Servlet 2 Servlet) : "+ sol);
		PrintWriter out=res.getWriter();
		out.println("Result(Servlet 2 Servlet) Using Session : "+ sol);


		ServletContext ctxt=getServletContext();
		ServletConfig cnfg=getServletConfig();		
		String s1=cnfg.getInitParameter("name");//config
		String s2=ctxt.getInitParameter("college");
		String s3=ctxt.getInitParameter("crush");
		String s4=ctxt.getInitParameter("friend");

		out.print(s1+"\n"+s2+"\n"+s3+"\n"+s4);



	}   
}