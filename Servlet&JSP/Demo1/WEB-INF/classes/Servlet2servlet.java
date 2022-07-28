import javax.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

@WebServlet("/v")
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


	}   
}