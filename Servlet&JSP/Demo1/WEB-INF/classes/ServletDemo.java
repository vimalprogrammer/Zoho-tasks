

import javax.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;


public class ServletDemo  extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		int n1=Integer.parseInt(req.getParameter("num1"));
		int n2=Integer.parseInt(req.getParameter("num2"));
		
		int result=n1+n2;
		
		PrintWriter out=res.getWriter();
		
		out.println("Result : "+result);
		
	}
}