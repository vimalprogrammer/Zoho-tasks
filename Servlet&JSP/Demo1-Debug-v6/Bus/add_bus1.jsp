<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Bus Details</title>
    <style>
    .reg {
      text-align: center;
      border: 3px solid green;
      background-color: lightblue;
    }
    </style>
</head>
<body>

<%
    //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 

    out.println("<div style='position: absolute; top: 0; right: 1; width: 100px; text-align:right;'><br><br><br><br><br><br><br>");
    out.println("<a href='../logout_admin.jsp' style='font-size:20px;'>Logout</a><br>");
    out.println("</div>");

// response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
// response.setHeader("Pragma", "no-cache"); 
response.setDateHeader("Expires", 0);

if(session.getAttribute("userid")==null)
{
    response.sendRedirect("../index.html");
}
%>

    <div class="reg"><center><br><h3>Register Bus Here</h3><br></center></div>
    <br>
    <br>
   <form method="post" action="add_bus2.jsp">
        <center>
        <table border="1" width="30%" cellpadding="3">
            <thead>
                <tr>
                    <th colspan="2" align ="left">Register Bus Here</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Enter Bus Number</td>
                    <td><input type="text" name="bus_number" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter Bus Name</td>
                    <td><input type="text" name="bus_name" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter number of seats</td>
                    <td><input type="text" name="seats" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter Sleeper(y/n)</td>
                    <td><input type="text" name="sleeper" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter departure place</td>
                    <td><input type="text" name="dep" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter destination place</td>
                    <td><input type="text" name="des" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter Price </td>
                    <td><input type="text" name="price" value="" required/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Add" /></td>
                    <td><input type="reset" value="Reset" /></td>
                </tr>
                <tr>
                </tr>
            </tbody>
        </table>
        <p>${message}</p>
        </center>
    </form>
    <br>
<center><a href="#" style="color: black;" onclick="javascript:window.history.back(-1);return false;">Back</a></center></body>
</body>