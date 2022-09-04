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
<style>
  body {
  justify-content: center;
  font-family: Roboto, Arial, sans-serif;
  font-size: 15px;
  }
</style>
</head>
<body>

<script type="text/javascript">
      function preventBack() {
    // body...
    window.history.forward();
}

setTimeout("preventBack()",0);
window=function(){null};
</script>

<div class="view"><br><br>Booking Details<br><br><br></div>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>

<%
//     out.println("<div style='position: absolute; top: 0; right: 1; width: 100px; text-align:right;'><br><br><br><br><br><br><br>");
//     out.println("<a href='../logout_user.jsp' style='font-size:20px;'>Logout</a><br>");
//     out.println("</div>");

// response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
// response.setHeader("Pragma", "no-cache"); 
// response.setDateHeader("Expires", 0);

//response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
//if(session.getAttribute("userid")==null)
//{
//    response.sendRedirect("../index.html");
//}

%>


<%

try
{
    String name = request.getParameter("name");
    String mail = request.getParameter("mail");
    String ticket_no = request.getParameter("ticket_no");
    String bus_no = request.getParameter("bus_no");
    String seat=(String)session.getAttribute("seat");
    String temp=(String)session.getAttribute("temp");
    String price=request.getParameter("price");

  if(name.equals("") || mail.equals("") || ticket_no.equals("")|| price.equals(""))
  {
    String message = "Fields can't be empty!";
    request.setAttribute("message", message);
    request.getRequestDispatcher("booked.jsp").forward(request, response);
  }


   Class.forName("org.postgresql.Driver").newInstance();
   Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
   c.setAutoCommit(false);
    //out.println("Opened ~~database~~ successfully");


  Statement stmt = c.createStatement();

String sql1 = "Update "+bus_no+" set seat_no='"+seat+"' where id='"+temp+"'; ";
stmt.executeUpdate(sql1);

  String sql = "INSERT INTO ticket_bookings (name,mail,ticket_no,bus_no,price) "
    + "VALUES ('"+name+"','"+mail+"','"+ticket_no+"','"+bus_no+"','"+price+"');";

  stmt.executeUpdate(sql);
  stmt.close();
  c.commit();
  c.close();
  // String message = "Ticket Booked Succesfully";
  // request.setAttribute("message", message);
  // request.getRequestDispatcher("booked.jsp").forward(request, response);
  }

  catch(Exception e){
  }
%>
<center>
<br><br>
<table border="1" cellpadding="5" width="500">
    <tr>
        <th>
            User_ID
        </th>
        <th>
            User Name
        </th>
        <th>
            Email
        </th>
        <th>
            Ticket ID
        </th>
        <th>
            Bus No
        </th>
        <th>
            Price
        </th>
        <th>
            Add to Calendar
        </th>
    </tr>
<%
try
{

 String username = request.getParameter("name");
    //out.println(username+"<br>");

 Class.forName("org.postgresql.Driver").newInstance();
 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
 //c.setAutoCommit(false);
 Statement stmt = c.createStatement();

 ResultSet rs2 = stmt.executeQuery( "SELECT * FROM ticket_bookings order by id desc limit 1");
 rs2.next();
 String id = rs2.getString("id");
 //out.println(id+"<br>");

 ResultSet rs = stmt.executeQuery( "SELECT * FROM ticket_bookings where id='"+id+"'");

  if(rs.next())
  {
    String google_sign_in=(String)session.getAttribute("google_sign_in");
    //out.println(google_sign_in);
    if(google_sign_in!=null)
    {
      out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2)+ "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td><td>" +rs.getString(5) +"</td><td>"+rs.getString(6)+"</td><td>"+"<button id='authorize_button' onclick='addto_cal()'>Add to calendar</button>"+"</td></tr>");
    }
    else
    {
    out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2)+ "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td><td>" +rs.getString(5) +"</td><td>"+rs.getString(6)+"</td><td>"+"<button id='authorize_button' onclick='handleAuthClick()''>Add to calendar</button>"+"</td></tr>");
    }
  }
 
 out.println("</table>");
 //stmt.executeUpdate(sql);

//stmt.executeUpdate(sql);
stmt.close();
c.close();

}
catch(Exception e)
{
    out.println("Error Caused\n "+e);        
    e.printStackTrace();
}
%>

</table>

<script>
  document.getElementById("authorize_button").addEventListener("click", function() {
    window.alert("SUccessfully added to google calendar!");
  });
</script>

<%-- <script>

<%String name1 = request.getParameter("name");%>
var name2="<%=name1%>";
console.log(name2);
</script> --%>

    <script src="https://apis.google.com/js/platform.js"></script>
    <!--Add buttons to initiate auth sequence and sign out-->
    <!--<button id="signout_button" onclick="handleSignoutClick()"></button>-->

    <pre id="content" style="white-space: pre-wrap;"></pre>

    <script type="text/javascript">
      /* exported gapiLoaded */
      /* exported gisLoaded */
      /* exported handleAuthClick */
      /* exported handleSignoutClick */

      // TODO(developer): Set to client ID and API key from the Developer Console
      const CLIENT_ID = '816881978221-bjj2gg9r7gj8r4ddks56h6nionsqf70g.apps.googleusercontent.com';
      const API_KEY = 'AIzaSyAwBfLkX3VANOdhHa16tlJb8uPO5HblJwI';
      

      // Discovery doc URL for APIs used by the quickstart
      const DISCOVERY_DOC = 'https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest';

      // Authorization scopes required by the API; multiple scopes can be
      // included, separated by spaces.
      const SCOPES = 'https://www.googleapis.com/auth/calendar.readonly';

      let tokenClient;
      let gapiInited = false;
      let gisInited = false;

      document.getElementById('authorize_button').style.visibility = 'hidden';
      //document.getElementById('signout_button').style.visibility = 'hidden';

      /**
       * Callback after api.js is loaded.
       */
      function gapiLoaded() {
        gapi.load('client', intializeGapiClient);
      }

      /**
       * Callback after the API client is loaded. Loads the
       * discovery doc to initialize the API.
       */
      async function intializeGapiClient() {
        await gapi.client.init({
          apiKey: API_KEY,
          discoveryDocs: [DISCOVERY_DOC],
        });
        gapiInited = true;
        maybeEnableButtons();
      }

      /**
       * Callback after Google Identity Services are loaded.
       */
      function gisLoaded() {
        tokenClient = google.accounts.oauth2.initTokenClient({
          client_id: CLIENT_ID,
          scope: SCOPES,
          callback: '', // defined later
        });
        gisInited = true;
        maybeEnableButtons();
      }

      /**
       * Enables user interaction after all libraries are loaded.
       */
      function maybeEnableButtons() {
        if (gapiInited && gisInited) {
          document.getElementById('authorize_button').style.visibility = 'visible';
        }
      }

      /**
       *  Sign in the user upon button click.
       */
      function handleAuthClick() {
        tokenClient.callback = async (resp) => {
          if (resp.error !== undefined) {
            throw (resp);
          }
          //document.getElementById('signout_button').style.visibility = 'visible';
          //document.getElementById('authorize_button').innerText = 'Refresh';
          await listUpcomingEvents();
          await insertEvents();//insert events to calendar

        };

        if (gapi.client.getToken() === null) {
          // Prompt the user to select a Google Account and ask for consent to share their data
          // when establishing a new session.
          tokenClient.requestAccessToken({prompt: 'consent'});
        } else {
          // Skip display of account chooser and consent dialog for an existing session.
          tokenClient.requestAccessToken({prompt: ''});
        }
      }

      //---------------------------------------------------------------
      window.handleCredentialResponse = (response) => {
      // decodeJwtResponse() is a custom function defined by you
      // to decode the credential response.
      const responsePayload = decodeJwtResponse(response.credential);
      
      //out.println(responsePayload.name);
      console.log("ID: " + responsePayload.sub);
      console.log('Full Name: ' + responsePayload.name);
      console.log('Given Name: ' + responsePayload.given_name);
      console.log('Family Name: ' + responsePayload.family_name);
      console.log("Image URL: " + responsePayload.picture);
      console.log("Email: " + responsePayload.email);

      var name = responsePayload.name;
      var email = responsePayload.email;
      // document.write(name);
      // document.write(email);;
    }

        function decodeJwtResponse(data) {
        var token = data.split(".");
        return JSON.parse(atob(token[1]));
      }
    //-------------------------------------------------------------------


      /**
       *  Sign out the user upon button click.
       */
      // function handleSignoutClick() {
      //   const token = gapi.client.getToken();
      //   if (token !== null) {
      //     google.accounts.oauth2.revoke(token.access_token);
      //     gapi.client.setToken('');
      //     document.getElementById('content').innerText = '';
      //     document.getElementById('authorize_button').innerText = 'Authorize';
      //     //document.getElementById('signout_button').style.visibility = 'hidden';
      //   }
      // }

      /**
       * Print the summary and start datetime/date of the next ten events in
       * the authorized user's calendar. If no events are found an
       * appropriate message is printed.
       */
      async function listUpcomingEvents() {
        let response;
        try {
          const request = {
            'calendarId': 'primary',
            'timeMin': (new Date()).toISOString(),
            'showDeleted': false,
            'singleEvents': true,
            'maxResults': 10,
            'orderBy': 'startTime',
          };
          response = await gapi.client.calendar.events.list(request);
        } catch (err) {
          document.getElementById('content').innerText = err.message;
          return;
        }

        const events = response.result.items;
        /*if (!events || events.length == 0) {
          document.getElementById('content').innerText = 'No events found.';
          return;
        }
        // Flatten to string to display
        const output = events.reduce(
            (str, event) => `${str}${event.summary} (${event.start.dateTime || event.start.date})\n`,
            'Events:\n');
        document.getElementById('content').innerText = output;
        */
      }

      // <%String name = request.getParameter("name");
      // String mail = request.getParameter("mail");%>
      // out.println(name);
      // out.println(mail);


      <%String name1 = request.getParameter("name");
        String mail1 = request.getParameter("mail");
        String ticket_no = request.getParameter("ticket_no");
        String bus_no = request.getParameter("bus_no");
        String seat=(String)session.getAttribute("seat");
        String temp=(String)session.getAttribute("temp");
        String price=request.getParameter("price");
      %>
      var name2="<%=name1%>";
      var mail2="<%=mail1%>";
      var ticket_no2="<%=ticket_no%>";
      var bus_no2="<%=bus_no%>";
      var seat2="<%=seat%>";
      var temp2="<%=temp%>";
      var price2="<%=price%>";

      var name3=name2.replaceAll(' ', '+');
      //console.log(name3);

      const url_debug="http://localhost:8080/Vimal_Bus_Reservation2/User/db_tkt.jsp?name="+name3+"&mail="+mail2+"&ticket_no="+ticket_no2+"&bus_no="+bus_no2+"&price="+price2;
      console.log(url_debug);

      function addto_cal()
      {
        // console.log(window.localStorage.getItem('token_val')['access_token']);
        //let token_val = localStorage.getItem('token_val');
        //console.log(JSON.stringify(token_val));
        console.log(JSON.parse(localStorage.getItem('token_val')));
        //document.write(window.localStorage.getItem('token_val'));
        gapi.client.setToken({
        access_token: JSON.parse(localStorage.getItem('token_val'))['access_token'],
        });
        // gapi.client.setToken(window.localStorage.getItem('token_val'));
        try {
          var resource = {
            "summary": "Vimal Bus Booking",
            "location": "Chennai",
              'description': url_debug,
            "start": {
              "dateTime": "2022-09-03T10:00:00.000-07:00"
            },
            "end": {
              "dateTime": "2022-09-04T10:25:00.000-07:00"
              }
            };
            //window.gapi.auth.setToken({ access_token: access_token })
            var request = gapi.client.calendar.events.insert({
            'calendarId': 'primary',
            'resource': resource
          });
          request.execute(function(resp) {
            console.log(resp);
          });   
        } 
        
        catch (err) {
          document.getElementById('content').innerText = err.message;
          return;
        }
      }

            async function insertEvents() {
        let response;
        try {
          var resource = {
            "summary": "Vimal Bus Booking",
            "location": "Chennai",
              'description': url_debug,
            "start": {
              "dateTime": "2022-09-03T10:00:00.000-07:00"
            },
            "end": {
              "dateTime": "2022-09-04T10:25:00.000-07:00"
              }
            };
          var request = gapi.client.calendar.events.insert({
            'calendarId': 'primary',
            'resource': resource
          });
          request.execute(function(resp) {
            console.log(resp);
          });   
        } 
        
        catch (err) {
          document.getElementById('content').innerText = err.message;
          return;
        }
      }
      
    </script>
    <script async defer src="https://apis.google.com/js/api.js" onload="gapiLoaded()"></script>
    <script async defer src="https://accounts.google.com/gsi/client" onload="gisLoaded()"></script>
<br>
<a href="../login2.jsp">Home</a></center></body>
</html>