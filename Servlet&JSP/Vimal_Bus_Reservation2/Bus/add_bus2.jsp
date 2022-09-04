<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vimal Travels</title>
<style>
.view {
  text-align: center;
  border: 3px solid green;
  background-color: lightblue;

}
</style>
   <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      body {
      justify-content: center;
      font-family: Roboto, Arial, sans-serif;
      font-size: 15px;
      }
      form {
      border: 5px solid #f1f1f1;
      }
      button {
      background-color: #8ebf42;
      color: white;
      padding: 14px 0;
      margin: 10px 0;
      border: none;
      cursor: grabbing;
      width: 100%;
      }
      h1 {
      text-align:center;
      fone-size:18;
      }
      button:hover {
      opacity: 0.8;
      }
      .formcontainer {
      text-align: left;
      margin: 24px 50px 12px;
      }
      .container {
      padding: 16px 0;
      text-align:left;
      }
    </style>

</head>
<body>

<div class="view"><br><br>Vimal Travels<br><br><br></div>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%

    //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 

    out.println("<div style='position: absolute; top: 0; right: 1; width: 100px; text-align:right;'><br><br><br><br><br><br><br>");
    out.println("<a href='../logout_admin.jsp' style='font-size:20px;'>Logout</a><br>");
    out.println("</div>");

// response.setHeader("Pragma", "no-cache"); 
// response.setDateHeader("Expires", 0);
  
if(session.getAttribute("userid")==null)
{
    response.sendRedirect("../index.html");
}
%>

<%
boolean flag=true;//check if bus already exists

try
{

 String bus_no = String.valueOf(request.getParameter("bus_number"));
 String bus_name = String.valueOf(request.getParameter("bus_name"));
 String seats=String.valueOf(request.getParameter("layout"));
 String sleeper_detail=String.valueOf(request.getParameter("sleeper_radio"));
 String sleeper_detail2=String.valueOf(request.getParameter("sleeper_radio2"));
 String last_row=String.valueOf(request.getParameter("last_row")); 

 // out.println(seats);
 // out.println(bus_no);
 // out.println(bus_name);
 // out.println(sleeper_detail);
 // out.println(sleeper_detail2);
 // out.println(last_row);
 if(last_row.equals("last_row"))
 {
  session.setAttribute("last_row",last_row);
 }

 //out.println(sleeper_detail);
 String sleeper = "";
 if(seats.equals("sl1"))
 {
  out.println("iiinnnnnS1");
  if(sleeper_detail.equals("sleeper") || sleeper_detail2.equals("sleeper2"))
  {
    if(last_row.equals("last_row"))
      seats="61";
    else
      seats="56";
    sleeper = "Yes";
  }

  else 
  { 
    if(last_row.equals("last_row"))
        seats="55";
      else
        seats="50";
      sleeper = "No";
  }
 }

 else if(seats.equals("sl2"))
 {
    out.println("iiinnnnnS2");
  if(sleeper_detail.equals("sleeper") || sleeper_detail2.equals("sleeper2"))
  { 
    if(last_row.equals("last_row"))
      seats="51";
    else
      seats="46";
    sleeper = "Yes";
  }
  else
  {
    if(last_row.equals("last_row"))
      seats="45";
    else
      seats="40";
    sleeper = "No";
  }
 }

else
{
  if(sleeper_detail.equals("sleeper") && sleeper_detail2.equals("sleeper2"))
  {
    out.println("iiinnnnnElse");
    seats="12";
    sleeper="Yes";
  }
}
out.println(seats);

 String ac = request.getParameter("ac");
 String dep = request.getParameter("dep");
 String des = request.getParameter("des");
 String price = request.getParameter("price");

 // out.println(bus_no+"<br>");
 // out.println(bus_name+"<br><br>");
 //   out.println(seats+"<br><br>");
 // out.println(sleeper+"<br>");
 // out.println(ac+"<br>"); 
 // out.println(dep+"<br>");
 // out.println(des+"<br>");

 // out.println(sleeper_detail+"<br>");
 // out.println(sleeper_detail+"<br>");


   Class.forName("org.postgresql.Driver").newInstance();
   Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
   c.setAutoCommit(false);
    //out.println("Opened ~~database~~ successfully");


  Statement stmt = c.createStatement();

 ResultSet rs = stmt.executeQuery( "SELECT * FROM bus_details where bus_id='"+bus_no+"'");
 out.println(bus_no);
if(rs.next())
{
    flag=false;
    // String message = "Bus with this number already xists!";
    // request.setAttribute("message", message);
    // request.getRequestDispatcher("add_bus1.jsp").forward(request, response);
    out.println("<script type=\"text/javascript\">");
    out.println("alert('Bus with this number already exists!');");
    out.println("location='add_bus1.jsp';");
    out.println("</script>");
    stmt.close();
    c.commit();
    c.close();
}

else
{
  String sql = "INSERT INTO Bus_Details (BUS_ID,BUS_NAME,TOTAL_SEATS,AC_or_NON_AC,DEPARTURE,DESTINATION, PRICE, AC) "
    + "VALUES ('"+bus_no+"','"+bus_name+"','"+seats+"','"+sleeper+"','"+dep+"','"+des+"','"+price+"','"+ac+"');";

  stmt.executeUpdate(sql);

  stmt.close();
  c.commit();
  c.close();

  }
}
  catch(Exception e){
  }

out.println("<center>");
out.println("<table border=\"1\" cellpadding=\"5\" width=\"500\">");
out.println("<tr>");
out.println("<th>");
out.println("Bus_ID");
out.println("</th>");
out.println("<th>");
out.println("Bus_Name");
out.println("</th>");
out.println("<th>");
out.println("Total_Seats");
out.println("</th>");
out.println("<th>");
out.println("sleeper");
out.println("</th>");
out.println("<th>");
out.println("Departure");
out.println("</th>");
out.println("<th>");
out.println("Destination");
out.println("</th>");
out.println("<th>");
out.println("Price");
out.println("</th>");
out.println("<th>");
out.println("AC");
out.println("</th>");
out.println("</tr>");

try
{
 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 c.setAutoCommit(false);

Statement stmt = c.createStatement();
ResultSet rs = stmt.executeQuery( "SELECT * FROM bus_details;" );

int bus_no=0;
String seats="";
out.println("<div class='formcontainer'><hr/><div class='container'>");
while (rs.next()) 
{
     bus_no = rs.getInt("bus_id");
     //out.println(bus_no);
     String bus_name = rs.getString("bus_name");
     seats = rs.getString("total_seats");
     String sleeper = rs.getString("ac_or_non_ac");
     String dep = rs.getString("departure");
     String des = rs.getString("destination");
     String price=rs.getString("price");
     String ac=rs.getString("ac");
    out.println("<tr><td>" + bus_no + "</td><td>" + bus_name + "</td><td>" + seats + "</td><td>" + sleeper + "</td><td>" + dep + "</td><td>" + des+"</td><td>"+price+"</td><td>"+ac+"</td></tr>");
  }
  String s="b"+bus_no;
  out.println(s);
//out.println("HEY HELLO");

//  String sql1="create table '"+s+"' " + " (id serial primary key,"+" seat_no int not null)";
// stmt.executeUpdate(sql1);
// sql1="insert into '"+s+"' (seat_no) generate_series(1,'"+seats+"');";
// stmt.executeUpdate(sql1);
// insert into bus_seats (seat_no)
// select i
// from generate_series(1,50) i;
//         select * from bus_seats;"

// stmt.close();
// c.commit();
// c.close();
String sql2="create table "+s+" (id serial primary key,"+" seat_no text not null)";
stmt.executeUpdate(sql2);
// String sql2="insert into "+s+" (seat_no) generate_series(1,'"+seats+"');";
// out.println("<br>HEY HELLO");
// stmt.executeUpdate(sql2);


//out.println("HEY HELLO");

//  String sql1="create table '"+s+"' " + " (id serial primary key,"+" seat_no int not null)";
// stmt.executeUpdate(sql1);
// sql1="insert into '"+s+"' (seat_no) generate_series(1,'"+seats+"');";
// stmt.executeUpdate(sql1);
// insert into bus_seats (seat_no)
// select i
// from generate_series(1,50) i;
//         select * from bus_seats;"

// stmt.close();
// c.commit();
// c.close();

String sql3="insert into "+s+" (seat_no) select i from generate_series(1,'"+seats+"') i";
stmt.executeUpdate(sql3);
stmt.close();
c.commit();
c.close();

}

catch(Exception e){
  out.println("Error "+ e);
}

%>

<br>
</table><br><br>
<a href="../admin_login.jsp">Home</a></center></body>
</html>