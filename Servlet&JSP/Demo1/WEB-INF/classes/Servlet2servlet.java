import javax.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.WebServlet;

@WebServlet("/v")
public class Servlet2servlet extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		
		// int sol=(int)req.getAttribute("r");//it is object so converting into string

		int sol=Integer.parseInt(req.getParameter("result"));
		sol=sol*sol;
		PrintWriter out=res.getWriter();
		out.println("Result(Servlet 2 Servlet) : "+ sol);

	}
}