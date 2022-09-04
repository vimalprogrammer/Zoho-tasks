import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoginVimal")
public class LoginVimal extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String un = request.getParameter("usr");
        String pw = request.getParameter("pwd");

        // if (un.equals("admin") && pw.equals("admin")) {
        //     response.sendRedirect("success.html");
        //     return;
        // } else {
        //     response.sendRedirect("error.html");
        //     return;
        // }

        out.println(un+"<br>"+pw);
    }