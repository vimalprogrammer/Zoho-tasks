import java.io.IOException;
import javax.servlet.ServletException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/login_d")
public class LoginVimal extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        
        res.setContentType("text/html");

        String un = req.getParameter("usr");
        String pw = req.getParameter("pwd");

        PrintWriter out=res.getWriter();
        // if (un.equals("admin") && pw.equals("admin")) {
        //     response.sendRedirect("success.html");
        //     return;
        // } else {
        //     response.sendRedirect("error.html");
        //     return;
        // }

        out.println(un+"<br>"+pw);
        out.println("Login Success Vishnu vimal Varsh VVV");
    }
}
