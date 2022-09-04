<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%><!DOCTYPE html>
<html>
    <head>
    <meta
      name="google-signin-client_id"
      content="816881978221-bjj2gg9r7gj8r4ddks56h6nionsqf70g.apps.googleusercontent.com"
    />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://accounts.google.com/gsi/client" async defer></script>        
    <title>Vimal Travels</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">

<style>
body {
  background-image: url('https://img.freepik.com/premium-vector/bus-transportation-template-illustration-design_183875-1143.jpg?w=2000');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 800px 400px;
  background-position: right;
  background-position: bottom 50px right 60px;
  background-repeat: no-repeat;
}
</style>

    <style>
      body {
      display: inline-block;
      text-align: center;
      justify-content: center;
      align-items: center;
      font-family: Roboto, Arial, sans-serif;
      font-size: 15px;
      }
      form {
      border: 5px solid #f1f1f1;
      }
      input[type=text], input[type=password] {
      width: 100%;
      padding: 16px 8px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
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
      text-align: center;
      margin: 24px 50px 12px;
      }
      .container {
      padding: 16px 0;
      text-align:left;
      }
      span.psw {
      float: right;
      padding-top: 0;
      padding-right: 15px;
      }
      /* Change styles for span on extra small screens */
      @media screen and (max-width: 300px) {
      span.psw {
      display: block;
      float: none;
      }
      }
      </style>
<!-- <script type="text/javascript">
      function preventBack() {
    // body...
    window.history.forward();
}

setTimeout("preventBack()",0);
window=function(){null};
</script> 
 </head> -->


<!-- <body>
    <br>
    <br><br><br>
    <center><h2>Admin Login</h2></center>
   <form method="post" action="admin_login.jsp">
        <center>
        <table border="1" width="30%" cellpadding="3">
            <thead>
                <tr>
                    <th colspan="2" align ="left">Login Here</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="usr" value="" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="pwd" value="" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Login"/></td>
                    <td><input type="reset" value="Reset"/></td>
                </tr>
            </tbody>
        </table>
        <br> -->
<!-- <!-         <p>Message: ${param.message}</p>
 --><!--            <p>${message}</p>
        <br>
        </center>
    </form>
</body> -->


<body>



<!--     <br>
    <br><br><br>
    
    <center><h2>Admin Login</h2></center>
   <form method="post" action="login_admin">
        <center>
        <table border="1" width="30%" cellpadding="3">
            <thead>
                <tr>
                    <th colspan="2" align ="left">Login Here</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="usr" value="" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="pwd" value="" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Login"/></td>
                    <td><input type="reset" value="Reset"/></td>
                </tr>
            </tbody>
        </table>
        <br>
<!-       <p>Message: ${param.message}</p>-->
<!--            <p>${message}</p>
        <br>
        </center>
        <center><a href="index.html">Back</a></body></center>
    </form>
</body> -->
  <body >
    <br><br>
   <form method="post" action="login_user" style="text-align: center;">
    <br><br><br>
      <h1>Login Form</h1>
      <div class="formcontainer">
      <hr/>
      <div class="container">
        <label for="uname"><strong>Username</strong></label><br>
        <input type="text" placeholder="Enter Username" name="usr" required>
        <label for="psw"><strong>Password</strong></label><br>
        <input type="password" placeholder="Enter Password" name="pwd" required>
      </div>
      <button type="submit">Login</button>
  </form>
  </div>

<div class="content" align="center">

 <%-- <div
      id="g_id_onload"
      data-client_id="651215858099-mkvbddsh8n1g0vrcftpun7urdbbb994m.apps.googleusercontent.com"
      data-context="signin"
      data-ux_mode="popup"
      data-callback="handleCredentialResponse"
      data-auto_prompt="false"
    ></div>

    <div
      class="g_id_signin"
      data-type="standard"
      data-shape="rectanular"
      data-theme="outline"
      data-text="signin_with"
      data-size="large"
      data-logo_alignment="left">
    </div> --%>

<%-- <script>
      // function handleCredentialResponse(response) {
      //   const responsePaayload = decodeJwtResponse(response.credential);
      //   console.log("ID: " + responsePaayload.sub);
      //   console.log("Name: " + responsePaayload.name);
      //   console.log("Email: " + responsePaayload.email);
      //   console.log("Picture: " + responsePaayload.picture);
      //   var name = responsePaayload.name;
      //   var email = responsePaayload.email;
      //   document.write(name);
      //   document.write(email);
      // document.getElementById("status").innerHTML = 'Welcome '+name+'!<a href=success.jsp?                  
      // email='+email+'&name='+name+'/>Continue with Google login</a></p>'
      //  window.location.replace("success.jsp");
      // }

    window.handleCredentialResponse = (response) => {
      // decodeJwtResponse() is a custom function defined by you
      // to decode the credential response.
      const responsePayload = decodeJwtResponse(response.credential);

      console.log("ID: " + responsePayload.sub);
      console.log('Full Name: ' + responsePayload.name);
      console.log('Given Name: ' + responsePayload.given_name);
      console.log('Family Name: ' + responsePayload.family_name);
      console.log("Image URL: " + responsePayload.picture);
      console.log("Email: " + responsePayload.email);

      var name = responsePayload.name;
      var email = responsePayload.email;
      // document.write(name);
      // document.write(email);
      window.location.replace("success_user.jsp?name="+name+"&email="+email);
      //document.getElementById("name").value=name;
      //document.location.href ="success.jsp?start="+start;
    }

      function decodeJwtResponse(data) {
        var token = data.split(".");
        return JSON.parse(atob(token[1]));
      }
    </script> --%>

    <button id="authorize_button" onclick="handleAuthClick()"><img src="https://ltgovcc.skills21.org/assets/signin_google-8ccd860edd04188160d7d75b1263736bed698179513caca8071f92399baa0f6e.png" style="width:230px; height: 50px;"></button>
    <%-- <button id="signout_button" onclick="handleSignoutClick()">Sign Out</button> --%>
    <%-- <button id="addto_cal" onclick="addto_cal()">Add to calendar</button> --%>

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
      const SCOPES = 'https://www.googleapis.com/auth/calendar https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile';

      let tokenClient;
      let gapiInited = false;
      let gisInited = false;

      document.getElementById('authorize_button').style.visibility = 'hidden';
      //document.getElementById('signout_button').style.visibility = 'hidden';
      //document.getElementById('addto_cal').style.visibility = 'hidden';

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
          //document.getElementById('addto_cal').style.visibility = 'visible';
          await listUpcomingEvents();
          showProfile();
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
      

      /**
       *  Sign out the user upon button click.
       */
      function handleSignoutClick() {
        const token = gapi.client.getToken();
        if (token !== null) {
          google.accounts.oauth2.revoke(token.access_token);
          gapi.client.setToken('');
          document.getElementById('content').innerText = '';
          document.getElementById('authorize_button').innerText = 'Authorize';
          document.getElementById('signout_button').style.visibility = 'hidden';
          document.getElementById('addto_cal').style.visibility = 'hidden';
        }
      }

      function addto_cal()
      {
        try {
          var resource = {
            "summary": "Vimal Bus Booking",
            "location": "Chennai",
              'description': "Trichy to Chennai at 9:00 PM -",
            "start": {
              "dateTime": "2022-08-30T10:00:00.000-07:00"
            },
            "end": {
              "dateTime": "2022-09-01T10:25:00.000-07:00"
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

      /**
       * Print the summary and start datetime/date of the next ten events in
       * the authorized user's calendar. If no events are found an
       * appropriate message is printed.
       */
      async function listUpcomingEvents() {
        let response;
        localStorage.setItem('token_val', JSON.stringify(gapi.client.getToken()));
        data = JSON.parse(localStorage.getItem('token_val'));
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
        if (!events || events.length == 0) {
          document.getElementById('content').innerText = 'No events found.';
          return;
        }
        // Flatten to string to display
        const output = events.reduce(
            (str, event) => `${str}${event.summary} (${event.start.dateTime || event.start.date})\n`,
            'Events:\n');
        //document.getElementById('content').innerText = output;
      }

     var name="";
     var email="";
     function showProfile() {
        //var auth2 = gapi.auth2.getAuthInstance();
        //var currentUser=JSON.parse(localStorage.getItem("authToken"));
        //console.log(gapi.auth2.getAuthInstance().currentUser.get().getBasicProfile().getName());
        //https://www.googleapis.com/oauth2/v1/userinfo?access_token=ya29.a0AVA9y1uzFyPPMSRB1LceBxRMbb3n5edSjMOewUClH28bdbWwvxGWkFbw1dZ2kuCznG0Ydximlu9INp9Yosy_vM3D7E3OCt6IhZdxv2mpialtmNq84gbD-FcIQe7_BcMF36SPAs1z858NzGyGYPdhQzA6zrjsaCgYKATASAQASFQE65dr8rWTQAqLKTd2UCytgr2hkmA0163
        // var profile = auth2.currentUser.get().getBasicProfile();
        // console.log(profile.getName());
        // console.log(profile.getEmail());
        try
        {
        gapi.client.setToken({
          access_token: JSON.parse(localStorage.getItem('token_val'))['access_token'],
        });

          console.log(JSON.parse(localStorage.getItem('token_val'))['access_token']);
          var url = 'https://www.googleapis.com/oauth2/v1/userinfo?access_token='+JSON.parse(localStorage.getItem('token_val'))['access_token'];

            $.ajax({
              type: 'GET',
              url: url,
              async: false,
              success: function(userInfo) {
                //info about user
                name=userInfo.name;
                email=userInfo.email;
                console.log(name);
                console.log(email);
                window.location.replace("success_user.jsp?name="+name+"&email="+email+"");
              },
              error: function(e) {
                console.log('error');

              }
            });
            
          <%
            int google_auth=1;
            out.println(google_auth);
          %>
        }
        catch(err)
        {
          console.log(err);
        }
      }

    </script>
    <script async defer src="https://apis.google.com/js/api.js" onload="gapiLoaded()"></script>
    <script async defer src="https://accounts.google.com/gsi/client" onload="gisLoaded()"></script>

  </div>
  </div>
<br>
      <a href="Reg.jsp" style="color:black;">New User Register</a>
      </label>
</body>
</html>